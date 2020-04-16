Rails.application.routes.draw do
  root 'welcome#show'
  resources :bathrooms, only: :show

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
                                      :sessions => 'users/sessions'}

  resources :map, only: :index #, path: '/auth/facebook/callback' #'/map'#
end
