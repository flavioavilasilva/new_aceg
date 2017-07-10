Rails.application.routes.draw do

  resources :photos
  get 'sessions/create'

  get 'feedbacks/new', to: 'feedbacks#new'
  resources "feedbacks", only: [:new, :create]
  get 'quemsomos', to: 'quem_somos#show'

  post '/set-location', to: 'location#create'

  devise_for :ongs, controllers: {
    registrations: 'ongs/registrations',
    sessions: 'ongs/sessions'
  }

  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks", registrations: "registrations_user" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'user_profiles/:id', as: :user_profile, to: 'user_profiles#show'

  root 'home#index'

  resources :ongs do
    resources :events, only: [:new, :create]
    resources :pets, only: [:new, :create, :show, :index, :edit, :update] do
      resources :adoptions, only: [:create]
      resources :photos
    end
  end

  resources :events, only: [:show]

  resources :pets, only:  [:index, :show, :edit, :update]

  resources :adoptions, only: [:show, :edit, :update]
end
