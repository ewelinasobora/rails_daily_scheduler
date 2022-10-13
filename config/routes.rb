Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  devise_for :users

  root :to => 'home#index'
  get "data", :to=>"event#get", :as=>"data"
  post "data/(:id)", :to => "event#add"
  put "data/:id", :to => "event#update"
  delete "data/:id", :to => "event#delete"

  resources :events
  post "events/:id/toggle", to: "events#toggle"

  #api
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
      resources :events, only: [:index, :create]
    end
  end
end
