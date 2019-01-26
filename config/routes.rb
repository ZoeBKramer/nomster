Rails.application.routes.draw do
  root 'places#index'
  resources :places
  get 'new', to: 'places#new'
end
