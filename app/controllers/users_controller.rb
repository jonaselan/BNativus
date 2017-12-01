class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :set_languages, only: %i[edit update]
  before_action :sanitize_page_params, only: %i[update create]
  before_action :authenticate_user!

  def show
    authorize! :show, @user
    @rooms = Room.includes_for_room.desc_with_limit 6
    @debates = Debate.includes_for_postings.desc_with_limit 4
    @articles = Article.includes_for_postings.desc_with_limit 4
  end

  def edit
    authorize! :edit, @user
  end

  def update
    avatar = params[:user][:avatar]
    params[:user][:avatar] = UploadService.process(avatar) if avatar.present?
    if @user.update(user_params)
      redirect_to @user, notice: t('.notice')
    else
      render :edit
    end
  end

  def my_rooms
    @rooms = current_user.rooms
  end

  def my_debates
    @debates = current_user.debates
  end

  def my_articles
    @articles = current_user.articles
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def sanitize_page_params
    params[:user][:gender] = params[:user][:gender].to_i
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user)
          .permit(:first_name, :last_name, :gender, :username, :email, :password,
                  :avatar, :born_on, :password_confirmation, :country, :bio, :phone,
                  user_known_languages_attributes: %i[
                    id known_languages_id speak write _destroy
                  ],
                  user_languages_studieds_attributes: %i[
                    id languages_studied_id speak write _destroy
                  ])
  end
end
