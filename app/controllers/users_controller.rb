class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :set_languages, only: [:more_informations, :edit, :update]
  before_action :adapt_params_to_int, only: [:update, :create]
  before_action :authenticate_user!

  def show
    authorize! :show, @user
    @rooms = Room.includes(:language, :user).order(created_at: :desc).limit 6
    @debates = Debate.includes(:language, :user, :category).order(created_at: :desc).limit 6
  end

  def edit
    authorize! :edit, @user
  end

  def update
    params[:user][:avatar] = upload_avatar unless params[:user][:avatar].blank?
    if @user.update(user_params)
      redirect_to @user, notice: t('.notice')
    else
      render :edit
    end
  end

  def more_informations
    current_user.user_known_languages.build
    current_user.user_languages_studieds.build
  end

  def add_more_informations
    if current_user.update(user_params)
      redirect_to user_path(current_user.id), notice: t('devise.registrations.signed_up')
    else
      render :more_informations
    end
  end

  def my_rooms
    @rooms = current_user.rooms
  end

  def my_debates
    @debates = current_user.debates
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def upload_avatar
      img = Cloudinary::Uploader.upload(params[:user][:avatar])
      img['url']
    end

    def adapt_params_to_int
      params[:user][:gender] = params[:user][:gender].to_i
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user)
            .permit(:first_name, :last_name, :gender, :username, :email, :password,
                    :avatar, :born_on, :password_confirmation, :country, :bio, :phone,
                      user_known_languages_attributes: [
                        :id, :known_languages_id, :speak, :write, :_destroy
                      ],
                      user_languages_studieds_attributes: [
                        :id, :languages_studied_id, :speak, :write, :_destroy
                      ]
                   )
    end
end
