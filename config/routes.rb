Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#show"

  resources :users, only: [:show] 
  resources :posts, only: [:create, :index, :destroy] do
  	resources :comments
  end

  resources :comments do
    resources :comments
  end
end

