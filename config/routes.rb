Rails.application.routes.draw do
  root "home#index"

  devise_for :users do
  end

  resources :groups do
    resources :projects
    post '/add_user' => 'groups#add_user', as: :add_user
    post '/remove_user' => 'groups#remove_user', as: :remove_user
  end

  resources :projects
end
