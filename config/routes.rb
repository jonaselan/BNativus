Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  scope ":locale", locale: /en|pt-br|es/ do # /#{I18n.available_locales.join("|")}/
    root to: "home#index"

    # authentication
    devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
                       skip: :omniauth_callbacks,
                       controllers: { registrations: 'registrations' }

    # TODO: nested routes
    resources :users, only: [:show] do
      collection do
        get 'more_informations' => 'users#more_informations'
        patch 'add_more_informations' => 'users#add_more_informations'
      end
    end
    resources :rooms, except: [:show]
  end

  get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  get '', to: redirect("/#{I18n.default_locale}")
end
