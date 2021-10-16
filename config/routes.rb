Rails.application.routes.draw do
  # usese the resources macro and only routes to the index and create method in the recipes controller
  resources :recipes, only: [:index, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  post "/signup", to: "users#create"
 
  # a route to retrieve the user's data from the database using the session hash
  get "/me", to: "users#show"
  
  post "/login", to: "sessions#create"

  # route for logging out  
  delete "/logout", to: "sessions#destroy"

end
