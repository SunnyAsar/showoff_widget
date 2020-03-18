Rails.application.routes.draw do
  # get 'widget/index'
  root 'widget#index'
  get 'widget/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
