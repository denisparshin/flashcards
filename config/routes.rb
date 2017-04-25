Rails.application.routes.draw do
  get 'trainer/index'

  root 'home#index'
  resources :cards
  get 'trainer' => 'trainer#index'
  put 'check_word' => 'trainer#check_word'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
