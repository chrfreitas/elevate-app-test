class Api::AuthenticationController < ApplicationController
  def signup
    user = User.new(email: params[:email])

    if user.save!
      token = Authentication::Token.encode(user_id: user.id)
      render json: { token: token }, status: :created
    end
  end
end

