Rails.application.routes.draw do
  root 'welcome#show'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :map, only: :index #, path: '/auth/facebook/callback' #'/map'#
end
