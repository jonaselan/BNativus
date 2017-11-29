class DebatesController < ApplicationController
  before_action :set_debate, only: %i[show edit update destroy upvote downvote]
  before_action :set_languages, only: %i[new edit create]
  before_action :set_categories, only: %i[new edit create]
  before_action :authenticate_user!

  def index
    @debates = Debate.includes_for_postings.desc_with_limit
  end

  def show
    @debate.increment!(:views) unless current_user == @debate.user
  end

  def new
    @debate = Debate.new
  end

  def edit
    authorize! :edit, @debate
  end

  def create
    @debate = Debate.new(debate_params)
    @debate.user = current_user
    if @debate.save
      current_user.increment!(:created_debates)
      redirect_to user_path(current_user), notice: t('.notice')
    else
      render :new
    end
  end

  def update
    if @debate.update(debate_params)
      redirect_to user_path(current_user), notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @debate
    @debate.destroy
    redirect_to user_path(current_user), notice: t('.notice')
  end

  def upvote
    @debate.upvote_from current_user
    redirect_to @debate
  end

  def downvote
    @debate.downvote_from current_user
    redirect_to @debate
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_debate
    @debate = Debate.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def debate_params
    params.require(:debate).permit(:title, :content, :language_id, :category_id)
  end
end
