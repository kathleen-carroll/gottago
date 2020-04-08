Rails.application.routes.draw do
  root 'welcome#show'
  resources :map, only: :index, path: '/map'#'/auth/facebook/callback'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

end
