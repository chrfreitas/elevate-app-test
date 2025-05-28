class AddCurrentStreakInDaysToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :current_streak_in_days, :integer, default: 0, null: false
    add_column :users, :current_streak_in_days_at, :datetime
  end
end
