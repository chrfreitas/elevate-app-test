require "rails_helper"

RSpec.describe Api::SessionController, type: :request do
  context "POST /api/sessions" do
    let!(:user) { create(:user) }

    it "should return unauthorized status code for the invalida user" do
      post "/api/sessions", params: { email: "xxx@email.com", password: "Password!123"}
      expect(response).to have_http_status(:unauthorized)
    end

    it "should return a valid token for the valid user" do
      post "/api/sessions", params: { email: "user@email.com", password: "Password!123"}
      expect(response).to have_http_status(:ok)
    end
  end
end
