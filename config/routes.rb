Rails.application.routes.draw do
  namespace :api do
    post "/user", to: "user#create"
    get "/user/:id", to: "user#show"
    post "/user/game_events", to: "game_event#create"
    post "/sessions", to: "session#create" 
  end
end
