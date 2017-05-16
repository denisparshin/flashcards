Rails.application.routes.draw do
 
  post 'sessions' => 'sessions#create'

  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout

  resources :users
  get 'trainer/index'

  root 'home#index'
  resources :cards
  get 'trainer' => 'trainer#index'
  put 'check_word' => 'trainer#check_word'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
