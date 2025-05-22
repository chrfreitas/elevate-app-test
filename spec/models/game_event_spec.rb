require 'rails_helper'

RSpec.describe GameEvent, type: :model do
  subject { build(:game_event) }
  
  context 'validations' do
    it { should validate_inclusion_of(:event_type).in_array(%w[COMPLETED]) }
  end
end