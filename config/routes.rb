Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pets, only: [:new, :create, :show]
  root 'home#index'
  resources :ongs, only: [:show, :new, :create]
end
