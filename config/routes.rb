Rails.application.routes.draw do

  resources :common_codes
  resources :presentations
  resources :users

  namespace :api do
  	resources :presentations, only: [:index, :show]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
