Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  match "/404", to: "errors#not_found", via: :all, as: :not_found
  match "/500", to: "errors#internal_server_error", via: :all, as: :internal_server_error

  scope ":locale", locale: /en|pt-br|es/ do # /#{I18n.available_locales.join("|")}/
    root to: "home#index"

    # authentication
    devise_for :users, path_names: { sign_in: "login", sign_out: "logout" },
                       skip: :omniauth_callbacks,
                       controllers: { registrations: 'registrations' }

    resources :users, only: %i[show edit update] do
      scope module: "users" do
        resources :informations, only: %i[index update]
      end
      collection do
        get 'my_rooms' => 'users#my_rooms'
        get 'my_debates' => 'users#my_debates'
        get 'my_article' => 'users#my_articles'
      end
    end
    resources :rooms, except: %i[show]

    # resources :comments
    resources :debates do
      member do
        put 'upvote' => 'debates#upvote'
        put 'downvote' => 'debates#downvote'
      end
    end
    resources :articles do
      member do
        put 'upvote' => 'articles#upvote'
        put 'downvote' => 'articles#downvote'
      end
    end

    get '*path', to: "errors#not_found"
  end

  # when is put some route without :locale parameter,
  # with the language is done redirect
  get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  get '', to: redirect("/#{I18n.default_locale}")
end
