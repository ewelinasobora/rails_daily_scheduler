Rails.application.routes.draw do
  root :to => 'home#index'
  get "data", :to=>"event#get", :as=>"data"
  post "data/(:id)", :to => "event#add"
  put "data/:id", :to => "event#update"
  delete "data/:id", :to => "event#delete"
end
