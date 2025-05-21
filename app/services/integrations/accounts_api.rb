class Integrations::AccountsApi
  BASE_URL = "https://interviews-accounts.elevateapp.com/api/v1"

  def initialize(user_id)
    @user_id = user_id
  end

  def get_billing_info
    url = "#{BASE_URL}/users/#{@user_id}/billing"
    
    http = Adapters::Http.new(url: url, token: ENV['BILLING_API_KEY'])
    http.get[:body]
  end
end