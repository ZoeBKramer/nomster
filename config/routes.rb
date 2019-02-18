Rails.application.routes.draw do
  devise_for :users
  root 'places#index'
  get 'new', to: 'places#new'
  resources :places do
    resources :comments, only: :create
    resources :photos, only: :create
  end  
  resources :users, only: :show
end
