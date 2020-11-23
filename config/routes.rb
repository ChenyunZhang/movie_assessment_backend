Rails.application.routes.draw do
  resources :votedowns
  resources :voteups
  get "/movies", to: "movies#index"

  post "/voteups", to: "voteups#create"
  delete "/voteups/:id", to: "voteups#destroy"
  post "/votedowns", to: "votedowns#create"
  delete "/votedowns/:id", to: "votedown#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
