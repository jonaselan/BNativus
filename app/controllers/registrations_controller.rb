class RegistrationsController < Devise::RegistrationsController
  protected

  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end

  def after_sign_up_path_for(_resource)
    user_informations_path(resource)
  end
end
