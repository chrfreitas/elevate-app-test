require "rails_helper"

RSpec.describe Api::AuthenticationController, type: :request do
  context "POST /api/sessions" do
    it "should return unauthorized status code for the invalida user" do
      create(:user)

      post "/api/sessions", params: { email: "xxx@email.com", password: "Password!123"}
      expect(response).to have_http_status(:unauthorized)
    end

    it "should return a valid token for the valid user" do
      create(:user)

      post "/api/sessions", params: { email: "user@email.com", password: "Password!123"}
      expect(response).to have_http_status(:ok)
    end
  end
end
