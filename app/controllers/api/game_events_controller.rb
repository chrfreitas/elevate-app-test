class Api::GameEventsController < Api::BaseController
  def create
    game_event = GameEvent.new(event_type: params[:type], game_name: params[:game_name],
                               occurred_at: params[:occurred_at], user_id: @current_user.id)

    if game_event.save
      render status: :created
    else
      render json: { error_message: game_event.errors.full_messages }, status: :bad_request
    end
  end
end
