Rails.application.routes.draw do
  namespace :api do
    post "/user", to: "authentication#signup"
    post "/sessions", to: "authentication#signin" 
  end
end
