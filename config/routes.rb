Rails.application.routes.draw do
  namespace :api do
    post "/user", to: "user#create"
    get "/user", to: "user#index"
    post "/sessions", to: "session#create" 
    post "/user/game_events", to: "game_event#index"
  end
end
