# spec/factories/game_events.rb

FactoryBot.define do
  factory :game_event do
    user
    event_type { "COMPLETED" }
    occurred_at { DateTime.now.utc }
  end
end
