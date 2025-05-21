Rails.application.routes.draw do
  namespace :api do
    post "/user", to: "users#create"
    get "/user", to: "users#show"
    post "/user/game_events", to: "game_events#create"
    post "/sessions", to: "sessions#create" 
  end
end
