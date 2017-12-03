class ArticlesController < PostingController
  before_action :set_article, only: %i[show edit update destroy upvote downvote]

  def index
    @articles = Article.includes_for_postings.desc_with_limit
    @articles = @articles.where('language_id = ?', params[:language]) unless params[:language].blank?
    @articles = @articles.where('category_id = ?', params[:category]) unless params[:category].blank?
  end

  def show
    @article.increment!(:views) unless current_user == @article.user
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
