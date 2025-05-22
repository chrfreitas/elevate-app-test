class AccountsApi
  def initialize(user_id)
    @user_id = user_id
  end

  def get_billing_info
    url = "#{ENV['ACCOUNT_API_URL']}/users/#{@user_id}/billing"
    
    http = HttpClient.new(url: url, token: ENV['ACCOUNT_API_KEY'])
    http.get[:body]
  end
end