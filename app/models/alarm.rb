class Alarm < ApplicationRecord
  scope :by_recency, -> { order(created_at: :desc) }

  before_save { self.text = text&.upcase }

  after_commit :notify_api

  def self.vote_for!(id)
    transaction do
      alarm = find(id)
      alarm.increment! :votes
    end
  end

  private

  def notify_api
    SomeAPI.notify! self
  end
end
