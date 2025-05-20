Rails.application.routes.draw do
  namespace :api do
    post "/user", to: "user#create"
    post "/sessions", to: "session#create" 
    post "/user/game_events", to: "game_event#index"
  end
end
