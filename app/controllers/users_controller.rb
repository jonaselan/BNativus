class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :set_languages, only: [:more_informations, :edit]
  before_action :authenticate_user!

  def show
    authorize! :show, @user
    @rooms = Room.includes(:language, :user).all
  end

  def edit
    authorize! :edit, @user
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def more_informations
    current_user.user_known_languages.build
  end

  def add_more_informations
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to user_path(current_user.id), notice: t('devise.registrations.signed_up') }
      else
        format.html { render :more_informations }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user)
            .permit(:username, :email, :password,
                    :password_confirmation, :country,
                      user_known_languages_attributes: [
                        :id, :known_languages_id, :speak, :write
                      ]
                   )
    end
end
