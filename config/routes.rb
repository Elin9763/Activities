Rails.application.routes.draw do
  
  get 'items/create'
  
  resources :users, :only => [:new, :create] #<-- created 7 restful routes but only allows 2(new and create)

  resources :lists do 
    resources :items
  end

  
  root 'lists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
