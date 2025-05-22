require 'rails_helper'

RSpec.describe GameEvent, type: :model do
  context 'validations' do
    it { should validate_inclusion_of(:event_type).in_array(["COMPLETED"])}
  end
end