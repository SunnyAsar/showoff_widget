Rails.application.routes.draw do
  get 'authentication/login'
  get 'users/create'
  resources :users
  get 'mywidgets', to: 'users#profile'
  post 'widget', to: 'widgets#create'
  get 'widget', to: 'users#profile'
  root 'widgets#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
