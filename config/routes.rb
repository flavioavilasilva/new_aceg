Rails.application.routes.draw do
  get 'sessions/create'

  post '/set-location', to: 'location#create'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
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

  resources :adoptions, only: [:show, :edit, :update]

  get '/minhas-ongs', to: 'ongs#my_ongs'
end
