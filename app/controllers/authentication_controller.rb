class AuthenticationController < ApplicationController
  def signup
    # render json: { token: 'ok' }

    user = User.new(email: params[:email])

    if !user.save
      render json: {
          token: 'ok'
      }
    end
  end
end

