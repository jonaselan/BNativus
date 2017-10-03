Rails.application.routes.draw do
  # authentication
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  resources :users, only: [:show, :edit, :update]

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
