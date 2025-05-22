class UserPresenter
  def initialize(user)
    @user = user
  end

  def as_json(*)
    {
      id: @user.id,
      email: @user.email,
      subscription_status: @user.subscription_status,
      stats: stats
    }
  end

  private 

  def stats
    {
      total_games_played: @user.game_events.count
    }
  end
end