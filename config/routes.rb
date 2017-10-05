Rails.application.routes.draw do
  root to: "home#index"

  # authentication
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  resources :users, only: [:show, :edit, :update]
  resources :rooms, except: [:show]
end
