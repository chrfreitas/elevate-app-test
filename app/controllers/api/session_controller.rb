class Api::SessionController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = Authentication::Token.encode(user_id: user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: "Invalid credentials" },  status: :unauthorized
    end
  end
end

