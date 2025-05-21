class Api::UserController < ApplicationController
  def show
    user = User.find(params[:id])

    if user.present?
      user_presenter = UserPresenter.new(user)
      render json: { user: user_presenter }, status: :ok
    else
      render status: :not_found
    end
  end

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

