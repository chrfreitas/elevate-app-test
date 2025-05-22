class GameEvent < ApplicationRecord
  belongs_to :user

  EVEN_TYPES = %w(COMPLETED)

  validates :event_type, inclusion: { in: EVEN_TYPES, message: "%{value} is not a valid value" }
end