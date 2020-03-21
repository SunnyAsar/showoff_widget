Rails.application.routes.draw do
  get 'public', to: 'public#index'
  post 'login', to:'authentication#login'
  get 'users/create'
  get 'logout', to: 'authentication#logout'
  resources :users
  get 'mywidgets', to: 'users#profile'
  post 'widget', to: 'widgets#create'
  get 'widget', to: 'users#profile'
  root 'widgets#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
