Rails.application.routes.draw do
  root "home#index"

  # concern :projectable do
  #   resources :projects
  # end

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :projects, except: [:create]

  resources :users, only: [:show] do
    resources :projects, only: [:create]
  end

  resources :groups do
    resources :projects, only: [:create]
    post '/add_user' => 'groups#add_user', as: :add_user
    post '/remove_user' => 'groups#remove_user', as: :remove_user
  end

end
