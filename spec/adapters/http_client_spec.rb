require "rails_helper"

RSpec.describe HttpClient do
  describe '#get' do
    let(:url) { "https://api.example.com/users/1/billing" }
    let(:token) { "12345" }
    let(:http) { described_class.new(url: url, token: token) }

    before do
      stub_request(:get, "https://api.example.com/users/1/billing")
        .to_return(status: 200, body: { total: 100 }.to_json, headers: { 'Content-Type' => 'application/json' })
    end


    it "returns a hash with the body and status code" do
      response = http.get
      expect(response).to eq({ body: { "total"=>100 }, status: 200 })
    end
  end
end
