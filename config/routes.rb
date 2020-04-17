Rails.application.routes.draw do
  root 'welcome#show'
  
  # namespace :users do
    #   delete '/sign_out', to: 'sessions#destroy' 
  # end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
    :sessions => 'users/sessions'}
    
  resources :map, only: :index #, path: '/auth/facebook/callback' #'/map'#
  
  resources :bathrooms, only: :show do 
    resources :reviews, only: [:new, :create]
  end 

  resources :advanced, only: :new
end
