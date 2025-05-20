require "rails_helper"

RSpec.describe Api::UserController, type: :request do
  context "POST /api/user" do
    it "should return bad request because the password is incorrect" do
      post "/api/user", params: { email: "test@email.com", password: "12345"}
      expect(response).to have_http_status(:bad_request)
    end

    it "should return bad request because the email is incorrect" do
      post "/api/user", params: { email: "xxxemail.com", password: "Password!123"}
      expect(response).to have_http_status(:bad_request)
    end

    it "should create a user and return a valid token" do
      post "/api/user", params: { email: "test@email.com", password: "Password!123"}
      expect(response).to have_http_status(:created)
    end
  end
end
