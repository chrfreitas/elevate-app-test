class Api::AuthenticationController < ApplicationController
  def signup
    user = User.new(email: params[:email], password: params[:password])

    if user.save!
      token = Authentication::Token.encode(user_id: user.id)
      render json: { token: token }, status: :created
    end
  end


  def signin
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = Authentication::Token.encode(user_id: user.id)
      render json: { token: token }, status: :created
    else
      render json: { error: "Invalid credentials" },  status: :unauthorized
    end
  end
end

