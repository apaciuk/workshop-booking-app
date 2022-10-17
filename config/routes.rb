# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :admin do
    authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
    end 
      resources :impersonates do
        post :impersonate, on: :member
        post :stop_impersonating, on: :collection
    end
    resources :posts
    get    '/',        to: 'home#index'
    get    'sign_in',  to: 'sessions#new'
    post   'sign_in',  to: 'sessions#create'
    delete 'sign_out', to: 'sessions#destroy'
    resources :users
    resource  :password_reset
  end
  resources :workshops, only: %i[index show update new create]
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'

end