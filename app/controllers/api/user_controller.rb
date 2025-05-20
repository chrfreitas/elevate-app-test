class Api::UserController < ApplicationController
  def create
    user = User.new(email: params[:email], password: params[:password])

    if user.save
      token = Authentication::Token.encode(user_id: user.id)
      render json: { token: token }, status: :created
    else
      render json: { error_message: user.errors.full_messages }, status: :bad_request
    end
  end
end

