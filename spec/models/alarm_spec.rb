require 'rails_helper'

RSpec.describe 'Alarm' do
  fixtures :alarms

  describe 'callbacks' do
    before do
      allow(SomeAPI).to receive(:notify!)
    end

    it 'upcases alarm text' do
      alarm = Alarm.new text: 'lowercase'
      expect { alarm.save! }.to change { alarm.text }.to('LOWERCASE')
    end

    it 'ignores empty text' do
      alarm = Alarm.new text: nil
      expect { alarm.save! }.to_not change { alarm.text }
    end

    it 'notifies some api' do
      alarm = Alarm.create! text: 'some alarm'

      expect(SomeAPI).to have_received(:notify!).with(alarm)
    end
  end

  describe '.by_recency' do
    it 'orders alarms from newest to oldest' do
      expect(Alarm.by_recency).to match [alarms(:newest), alarms(:oldest)]
    end
  end

  describe '.vote_for!(id)' do
    let(:alarm) { alarms(:oldest) }

    it 'increments vote counter by one' do
      expect {
        Alarm.vote_for! alarm.id
      }.to change { alarm.reload.votes }.by(1)
    end
  end
end
