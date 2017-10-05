Rails.application.routes.draw do
  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do

    root to: "home#index"

    # authentication
    devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

    resources :users, only: [:show, :edit, :update]
    resources :rooms, except: [:show]
  end

  get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  get '', to: redirect("/#{I18n.default_locale}")
end
