Rails.application.routes.draw do
  root 'welcome#show'
  resources :bathrooms, only: [:show, :new, :create]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
    :sessions => 'users/sessions'}

  resources :map, only: :index

  resources :bathrooms, only: :show do
    resources :reviews, only: [:new, :create]
  end

  resources :advanced, only: :new
end
