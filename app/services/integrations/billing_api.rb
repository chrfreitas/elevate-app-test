class Integrations::BillingApi
  BASE_URL = "https://interviews-accounts.elevateapp.com/api/v1"

  def initialize(user_id)
    @user_id = user_id
  end

  def run 
    url = billing_url(@user_id)
    
    http = Adapters::Http.new(url: url, token: ENV['BILLING_API_KEY'])
    http.get
  end

  private 

  def billing_url(user_id)
    "#{BASE_URL}/users/#{user_id}/billing"
  end
end