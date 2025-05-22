require "rails_helper"  # or just `require "spec_helper"` if standalone
require "jwt"

RSpec.describe AuthToken do
  let(:payload) { { user_id: 123 } }

  describe "#decode" do
    it "returns nil when pass a nil as parameter" do
      expect(AuthToken.decode(nil)).to be_nil
    end

    it "raises InvalidToken when decoding an invalid token" do
      expect {
        AuthToken.decode("invalid.token.string")
      }.to raise_error(AuthToken::InvalidToken, "Invalid token")
    end

    it "raises ExpiredToken when decoding an expired token" do
      expired_token = AuthToken.encode(payload, 1.hour.ago)

      expect {
        AuthToken.decode(expired_token)
      }.to raise_error(AuthToken::ExpiredToken, "Token has expired")
    end
  end
end
