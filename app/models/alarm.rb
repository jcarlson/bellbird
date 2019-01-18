class Alarm < ApplicationRecord
  scope :by_recency, -> { order(created_at: :desc) }

  before_save { self.text = text&.upcase }

  def self.vote_for!(id)
    transaction do
      alarm = find(id)
      alarm.increment! :votes
    end
  end
end
