class Adapters::Http
  def initialize(url:, token:)
    @url = url
    @conn = Faraday.new(url: url) do |builder|
      builder.request :authorization, :Basic, token
      builder.response :json
    end
  end

  def get
    response = @conn.get
    response.body
  end
end