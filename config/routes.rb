Rails.application.routes.draw do
  resources :lists
  get 'site/index'
  root 'site#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
