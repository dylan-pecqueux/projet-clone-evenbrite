Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :attendances, only: [:new, :create, :show]
    resources :pictures, only: [:create]
  end
  resources :users do
    resources :avatars, only: [:create]
  end
  root 'events#index'
end
