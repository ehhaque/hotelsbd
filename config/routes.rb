Hotelsbd::Application.routes.draw do
  #resources :rooms

  #resources :hotels
  resources :hotels do
	   resources :rooms
  end

  root "pages#home"    
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  
  # Custom Routes
  get '/all_hotels', controller: "hotels", action: "all_hotels"
  post '/add_room', controller: "rooms", action: "add_room"
    
    
  devise_for :users
  
  namespace :admin do
    root "base#index"
    resources :users
  end
  
end
