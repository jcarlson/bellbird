require 'rails_helper'

RSpec.describe 'Alarm' do

  describe '.before_save' do
    it 'upcases alarm text' do
      alarm = Alarm.new text: 'lowercase'
      expect { alarm.save! }.to change { alarm.text }.to('LOWERCASE')
    end

    it 'ignores empty text' do
      alarm = Alarm.new text: nil
      expect { alarm.save! }.to_not change { alarm.text }
    end
  end

  describe '.by_recency' do
    fixtures :alarms

    it 'orders alarms from newest to oldest' do
      expect(Alarm.by_recency).to match [alarms(:newest), alarms(:oldest)]
    end
  end
end
