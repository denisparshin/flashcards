Rails.application.routes.draw do
 
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users

  
  get '/auth/:provider/callback', to: 'sessions#create'

  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout

  resources :users
  get 'trainer/index'

  root 'home#index'
  get 'persons/profile', as: 'user_root'
  resources :cards
  get 'trainer' => 'trainer#index'
  put 'check_word' => 'trainer#check_word'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
