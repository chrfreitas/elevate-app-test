class Api::BaseController < ApplicationController
  before_action :authorize_request

  attr_reader :current_user

  private

  def authorize_request
    header = request.headers["Authorization"]
    token = header.split(" ").last if header

    begin
      decoded = AuthToken.decode(token)
    rescue AuthToken::InvalidToken
      render json: { error: 'Invalid token' }, status: :unauthorized
      return
    rescue AuthToken::ExpiredToken
      render json: { error: 'Token has expired' }, status: :unauthorized
      return
    end

    if decoded
      @current_user = User.find(decoded["user_id"])
    else
      render status: :unauthorized
    end
  end
end
