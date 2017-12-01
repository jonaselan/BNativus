class Users::InformationsController < ApplicationController
  before_action :set_languages, only: %i[index]

  def index
    current_user.user_known_languages.build
    current_user.user_languages_studieds.build
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id), notice: t('devise.registrations.signed_up')
    else
      redirect_to user_informations_path(current_user)
    end
  end

  private
  def user_params
    params.require(:user)
          .permit(:country,
                  user_known_languages_attributes: %i[
                    id known_languages_id speak write _destroy
                  ],
                  user_languages_studieds_attributes: %i[
                    id languages_studied_id speak write _destroy
                  ])
  end
end
