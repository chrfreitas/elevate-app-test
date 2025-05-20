require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should allow_value('!Password123').for(:password) }
  end
end