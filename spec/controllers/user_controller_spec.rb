require "rails_helper"

RSpec.describe Api::UserController, type: :request do
  context "GET /api/user/:id" do
    context "when it didn't find a user" do
      it "returns not found status code" do
        get "/api/user/1"
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when it finds a user" do
      let!(:user) {create(:user) }

      it "should return ok status code" do
        get "/api/user/#{user.id}"
        expect(response).to have_http_status(:ok)
      end

      it "should return the user object" do
        get "/api/user/#{user.id}"

        json = JSON.parse(response.body)

        expect(json).to eq({
          "user" => {
            "id" => user.id,
            "email" => user.email,
            "stats" => {
              "total_games_played" => 10
            },
            "subscription_status" => nil
          }
        })

      end
    end
  end

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
