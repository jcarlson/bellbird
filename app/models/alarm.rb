class Alarm < ApplicationRecord
  scope :by_recency, -> { order(created_at: :desc) }

  before_save { self.text = text&.upcase }

end
