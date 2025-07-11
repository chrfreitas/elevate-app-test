class GameEvent < ApplicationRecord
  belongs_to :user

  EVENT_TYPES = %w[COMPLETED]

  validates :event_type, inclusion: { in: EVENT_TYPES }
end
