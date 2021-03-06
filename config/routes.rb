Rails.application.routes.draw do
  
  get '/signup' => "users#new", :as => "signup"
  get '/login' => "sessions#new", :as => "login"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"
  get '/auth/:provider/callback' => 'sessions#create'
  
  put 'completed_item', to: 'items#complete', as: :completed_item
  get 'completed_most', to: 'users#show_completed', as: :completed_most

  resources :users, :only => [:new, :create] #<-- created 7 restful routes but only allows 2(new and create)

  resources :lists do 
    resources :items
  end


  root 'welcome#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
