module Omniauthenticable
  extend ActiveSupport::Concern

  included do
    def self.from_omniauth(data)
      existing_user = User.find_by(email: data['info']['email'])

      if existing_user
        existing_user.update!(provider: data.provider, uid: data.uid)
        existing_user
      else
        where(provider: data.provider, uid: data.uid).first_or_create do |user|
          user.email                 = data.info.email
          user.password              = Devise.friendly_token[0, 20]
          user.password_confirmation = user.password
          user.username              = data.info.name.parameterize.underscore
          user.first_name            = data.info.first_name
          user.last_name             = data.info.last_name
          user.avatar                = data.info.image
        end
      end
    end

    # def self.new_with_session(params, session)
    #   super.tap do |user|
    #     data = session['devise.facebook_data'] &&
    #       session['devise.facebook_data']['extra']['raw_info']
    # 
    #     user.email = data['email'] if data && user.email.blank?
    #   end
    # end
  end
end