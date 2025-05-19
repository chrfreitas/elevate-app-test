Rails.application.routes.draw do
  post '/api/user', to: "authentication#signup"
end
