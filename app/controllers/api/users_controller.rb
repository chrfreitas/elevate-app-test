class Api::UsersController < Api::BaseController
  before_action :authorize_request, only: [:show]

  def show
    user = User.find(@current_user.id)

    if user.present?
      user_presenter = UserPresenter.new(user)
      render json: { user: user_presenter }, status: :ok
    else
      render status: :not_found
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      SubscriptionStatusSyncWorker.perform_async(user.id)

      token = AuthToken.encode(user_id: user.id)
      render json: { token: token }, status: :created
    else
      render json: { error_message: user.errors.full_messages }, status: :bad_request
    end
  end


  private

  def user_params
    params.permit(:email, :password)
  end
end

