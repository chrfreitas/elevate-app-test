Rails.application.routes.draw do
  namespace :api do
    post "/user", to: "authentication#signup"
    post "/sessions", to: "authentication#signin" 
    post "/user/game_events", to: "game_event#index"
  end
end
