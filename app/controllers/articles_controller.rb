class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_languages, only: [:new, :edit, :create]
  before_action :set_categories, only: [:new, :edit, :create]
  before_action :authenticate_user!

  def index
    @articles = Article.includes_for_postings.desc_with_limit
  end

  def show
    @article.increment!(:views) unless current_user == @article.user
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def edit
    authorize! :edit, @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      current_user.increment!(:created_articles)
      redirect_to user_path(current_user), notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to user_path(current_user), notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @article
    @article.destroy
    redirect_to user_path(current_user), notice: t('.notice')
  end

  def upvote
    @article.upvote_from current_user
    redirect_to @article
  end

  def downvote
    @article.downvote_from current_user
    redirect_to @article
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :language_id, :category_id)
    end
end
