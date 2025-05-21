class AddSubscriptionStatusSyncedAtToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :subscription_status_synced_at, :datetime, null: true
  end
end
