Rails.application.routes.draw do

  resources :comments
  resources :common_codes
  resources :presentations
  resources :users

  namespace :api do
    resources :categories, only: [:index]
    resources :categories, only: :index do
      collection do
        get :presentations
      end
    end
    resources :favorites, only: :index
    resources :teams, only: [:index] do
      collection do
        get :presentations
      end
    end
    resources :presentations, only: [:index, :show]
    resources :presentations, only: [:show] do
      resources :comments
      post :thumbsup
      post :thumbsdown
    end
    resources :users, only: :index do
      collection do
        get :presentations
        get :favorite_presentations
        post :modify
        post :authentication
        post :signup
        post :signin
      end
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
