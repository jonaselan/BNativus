class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :omniauth_auth
  
  def google_oauth2
  end
  
  def facebook
  end

  def omniauth_auth
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in(@user)
      if @user.created_at > 1.minute.ago
        redirect_to user_informations_path(@user)
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
