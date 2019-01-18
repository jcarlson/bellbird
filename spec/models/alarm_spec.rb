require 'rails_helper'

RSpec.describe 'Alarm' do
  describe '.by_recency' do
    fixtures :alarms

    it 'orders alarms from newest to oldest' do
      expect(Alarm.by_recency).to match [alarms(:newest), alarms(:oldest)]
    end
  end
end
