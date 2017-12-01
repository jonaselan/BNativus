class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  rescue_from CanCan::AccessDenied do |_exception|
    # redirect_to root_url, notice: exception.message
    redirect_to not_found_url
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[username email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def set_languages
    @languages ||= Language.order(created_at: :asc).pluck(:name, :id)
    @languages.each { |lang| lang[0] = t(lang[0]) }
  end

  def set_categories
    @categories = Category.order(created_at: :asc).pluck(:title, :id)
    @categories.each { |lang| lang[0] = t(lang[0]) }
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    # I18n.locale = params[:locale] if params[:locale].present?
    # I18n.locale = current_user.try(:locale) || I18n.default_locale
  end

  def default_url_options(_options = {})
    { locale: I18n.locale }
  end
end
