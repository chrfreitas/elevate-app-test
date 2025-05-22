class SubscriptionStatusSyncWorker
  include Sidekiq::Worker

  def perform(user_id = nil)
    users = get_users(user_id)

    users.find_each do |user|
      billing_info = AccountsApi.new(user.id).get_billing_info

      if billing_info["error"]
        Rails.logger.error "Failed to fetch data for user #{user.id} via AccountsApi" 
        return;
      end

      if billing_info["subscription_status"] != user.subscription_status
        user.update!(subscription_status: billing_info["subscription_status"], subscription_status_synced_at: DateTime.now.utc)

        Rails.logger.info "User #{user.id} was successfully updated."
      end
    end
  end

  private

  def get_users(user_id)
    user_id ?
      User.where(id: user_id) :
      User.where(
        "subscription_status_synced_at IS NULL OR subscription_status_synced_at < ?",
        24.hours.ago
      )
  end
end
