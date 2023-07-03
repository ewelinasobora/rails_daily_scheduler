# frozen_string_literal: true

Rails.application.routes.draw do
  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'

  mount Rapporteur::Engine, at: '/status'

  devise_for :users

  root to: 'calendar#index'
  get 'data', to: 'event#get', as: 'data'
  post 'data/(:id)', to: 'event#add'
  put 'data/:id', to: 'event#update'
  delete 'data/:id', to: 'event#delete'

  resources :events
  post 'events/:id/toggle', to: 'events#toggle'

  # api
  # namespace :api do
  #   namespace :v1 do
  #     resources :users, only: [:index]
  #     resources :events, only: %i[index create]
  #   end
  # end
end
