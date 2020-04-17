Rails.application.routes.draw do
  root 'welcome#show'
  
  namespace :users do
  #   delete '/sign_out', to: 'sessions#destroy' 
      get 'bathroom/:bathroom_id/reviews/new', to: 'reviews#new'
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
                                      :sessions => 'users/sessions'}

  resources :map, only: :index #, path: '/auth/facebook/callback' #'/map'#

  resources :bathrooms, only: :show
end
