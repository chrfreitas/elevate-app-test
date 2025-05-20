require 'rails_helper'

RSpec.describe User, type: :model do
  context 'password validation' do
    it 'must have 1 uppercase, 1 lower case, 1 digit and 1 special character' do
      user = User.new(email: "blabla", password: "!Password123")
      expect(user).to be_valid
    end    
  end
end