Rails.application.routes.draw do

  resources :common_codes
  resources :presentations
  resources :users

  namespace :api do
    resources :categories, only: [:index]
    resources :teams, only: [:index]
    resources :presentations, only: [:index, :show]
    resources :users, only: :index do
      collection do
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
