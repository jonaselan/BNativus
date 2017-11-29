class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'].info)
    if @user.persisted?
      sign_in(@user)
      if @user.created_at > 1.minute.ago
        redirect_to more_informations_users_path
      else
        redirect_to @user, event: :authentication
      end
    else
      redirect_to new_user_registration_url, alert: t(@user.errors.full_messages.join("\n"))
    end
  end

  def failure
    redirect_to root_path
  end
end
