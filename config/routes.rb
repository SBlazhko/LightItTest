Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"

  resources :posts, only: [:create, :index, :destroy, :update] do
  	resources :comments, only: [:create, :destroy, :new]
  end

  resources :comments do
    resources :comments, only: [:create, :destroy, :new]
  end
end

