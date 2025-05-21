require 'rails_helper'

RSpec.describe SubscriptionStatusSyncWorker, type: :worker do
  describe '#perform' do
    let(:user_id) { 1 }
    let(:billing_info) do
      { "subscription_status" => "active" }
    end

    before do
      allow(Integrations::AccountsApi).to receive(:new)
        .with(user_id)
        .and_return(double(get_billing_info: billing_info))
    end

    context 'subscription_status has changes and the last synced was upper 24 hours' do
      let!(:user) { create(:user, id: user_id, subscription_status: "expired", subscription_status_synced_at: 25.hours.ago) }

      it 'updates the user\'s subscription_status with the new value' do
        expect {
          described_class.new.perform
        }.to change { user.reload.subscription_status }.from("expired").to("active")
      end
    end

    context 'when the subscription_status is the same as the response from api' do
      let!(:user) { create(:user, id: user_id, subscription_status: "active", subscription_status_synced_at: 25.hours.ago) }

      it 'does not update the subscription_status' do
        expect {
          described_class.new.perform
        }.not_to change { user.reload.updated_at }
      end
    end

    context 'when the subscription_status was synced within 24 hours' do
      let!(:user) { create(:user, id: user_id, subscription_status: "active", subscription_status_synced_at: 2.hours.ago) }

      it 'does not update the subscription_status' do
        described_class.new.perform

        expect(Integrations::AccountsApi).not_to receive(:new).with(user.id)        
      end
    end
  end
end
