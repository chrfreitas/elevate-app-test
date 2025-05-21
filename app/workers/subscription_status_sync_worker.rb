class SubscriptionStatusSyncWorker
  include Sidekiq::Worker

  def perform
    users = User.all

    users.each do |user|
      billing_info = Integrations::AccountsApi.new(user.id).get_billing_info

      if billing_info["subscription_status"] != user.subscription_status
        user.update!(subscription_status: billing_info["subscription_status"]) 
      end
    end
  end
end
