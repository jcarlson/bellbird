class Alarm < ApplicationRecord
  scope :by_recency, -> { order(created_at: :desc) }
end
