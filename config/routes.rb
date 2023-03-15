Rails.application.routes.draw do
  devise_for :users
  root :to => 'home#index'
  get "data", :to=>"event#get", :as=>"data"
  post "data/(:id)", :to => "event#add"
  put "data/:id", :to => "event#update"
  delete "data/:id", :to => "event#delete"

  resources :events
  post "events/:id/toggle", to: "events#toggle"
end
