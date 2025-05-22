class GameEvent < ApplicationRecord
  belongs_to :user

  validates :event_type, inclusion: { in: %w(COMPLETED), message: "%{value} is not a valid value" }
end