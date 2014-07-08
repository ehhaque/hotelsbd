Hotelsbd::Application.routes.draw do
  resources :hotels

  root "pages#home"    
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  
  # Custom Routes
  get '/all_hotels', controller: "hotels", action: "all_hotels"
    
  devise_for :users
  
  namespace :admin do
    root "base#index"
    resources :users
  end
  
end
