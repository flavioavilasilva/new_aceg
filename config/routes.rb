Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :ongs, only: [:show, :new, :create, :index] do
    resources :events, only: [:new, :create]
    resources :pets, only: [:new, :create, :show, :index] do
      resources :adoptions, only: [:create]
    end
  end

  resources :events, only: [:show]

  resources :pets, only:  [:index, :show]

  resources :adoptions, only: [:show]

  get '/minhas-ongs', to: 'ongs#my_ongs'
end
