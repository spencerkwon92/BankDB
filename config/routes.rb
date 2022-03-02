#routes function is that create the path that we will user for the MVC pattern.

Rails.application.routes.draw do
  get 'products/index'
  get 'banks/index'
  # get 'sessions/new'
  # get 'memos/index'
  # get 'preferences/index'
  # get 'users/index'
  get "signup" => 'users#new'
  get "login" => 'sessions#new'
  get "logout" => 'sessions#destory'
  
  get 'auth/:provider/callback', to: 'authentications#create'
  
  resources :users
  resources :sessions
  
  resources :banks do
    resources :products
  end
  
  resources :preferences do
    resources :memos
  end

  root to:'home#index'
  get "about" => 'home#about'
  get "guidesignup" => 'home#guidesignup'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
