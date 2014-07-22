Hotelsbd::Application.routes.draw do
  resources :paintings

  resources :bed_types

  resources :room_types

  resources :star_ratings

  resources :cities

  #get "search/index"
  
  resources :hotels do
	   resources :rooms
  end

  root "search#index"
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  
  # Custom Routes
  get '/', controller: "search", action: "index"
  get '/search', controller: "search", action: "search"
  get '/all_hotels', controller: "hotels", action: "all_hotels"
  post '/add_room', controller: "rooms", action: "add_room"
    
    
  devise_for :users
  
  namespace :admin do
    root "base#index"
    resources :users
  end
  
end
