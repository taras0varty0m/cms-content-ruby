# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events
      resources :screens
      resources :playlists
      resources :contents
      resources :playlist_contents
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
