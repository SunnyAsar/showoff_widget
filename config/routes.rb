Rails.application.routes.draw do
  get 'authentication/login'
  get 'users/create'
  resources :users
  # get 'widget/index'
  root 'widget#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
