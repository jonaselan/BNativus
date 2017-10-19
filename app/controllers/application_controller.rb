class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  rescue_from CanCan::AccessDenied do |exception|
    # TODO: redirect to (create) 404 page
    redirect_to root_url, notice: exception.message
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def set_languages
    # [[name, id]]
    @languages = Language.pluck(:name, :id)
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    # I18n.locale = params[:locale] if params[:locale].present?
    # I18n.locale = current_user.try(:locale) || I18n.default_locale
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

end
