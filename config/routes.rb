# frozen_string_literal: true

Rails.application.routes.draw do
  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => '/sidekiq'

  mount Rapporteur::Engine, at: '/status'

  # devise_for :users
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: 'calendar#index'
  get '/data/fetch_action', to: 'event#fetch_weatherapi', as: 'calendar_fetch_weatherapi'
  get 'data', to: 'event#get', as: 'data'
  post 'data/(:id)', to: 'event#add'
  put 'data/:id', to: 'event#update'
  delete 'data/:id', to: 'event#delete'

  resources :events

  post 'events/:id/toggle', to: 'events#toggle'
end
