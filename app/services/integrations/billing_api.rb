class Integrations::BillingApi
  BASE_URL = "https://interviews-accounts.elevateapp.com/api/v1"

  def initialize(user_id)
    @user_id = user_id
  end

  def run 
    url = billing_url(@user_id)

    conn = Faraday.new(url: url) do |builder|
      builder.request :authorization, :Basic, ENV['BILLING_API_KEY']
      builder.response :json
    end
    
    response = conn.get(url)

    response.body
  end

  private 

  def billing_url(user_id)
    "#{BASE_URL}/users/#{user_id}/billing"
  end
end