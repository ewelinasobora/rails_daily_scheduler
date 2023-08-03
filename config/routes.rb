# frozen_string_literal: true

Rails.application.routes.draw do
  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => '/sidekiq'

  mount Rapporteur::Engine, at: '/status'

  devise_for :users

  root to: 'calendar#index'
  get '/data/fetch_action', to: 'event#fetch_weatherapi', as: 'calendar_fetch_weatherapi'
  get 'data', to: 'event#get', as: 'data'
  post 'data/(:id)', to: 'event#add'
  put 'data/:id', to: 'event#update'
  delete 'data/:id', to: 'event#delete'

  resources :events

  get 'published', to: 'events#published'
  post 'events/:id/toggle', to: 'events#toggle'

  # api
  # namespace :api do
  #   namespace :v1 do
  #     resources :users, only: [:index]
  #     resources :events, only: %i[index create]
  #   end
  # end
end

# user registers with location
# once user registers it queues the job to call the weaterapi and it creates week worth of events if rains/not rains
# then everyday it creates or updates events for all locations for all users
# notifications
