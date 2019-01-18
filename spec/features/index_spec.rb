require 'rails_helper'

RSpec.describe 'Alarms Index' do
  fixtures :alarms

  let(:alarm1) { alarms(:oldest) }
  let(:alarm2) { alarms(:newest) }

  scenario 'visit alarm index' do
    visit '/index'

    expect(page).to have_text("#{alarm1.id} -- #{alarm1.text}")
    expect(page).to have_text("#{alarm2.id} -- #{alarm2.text}")
  end

  scenario 'create new alarm' do
    visit '/index'

    expect {
      fill_in 'Text', with: 'this is the new alarm'
      click_on 'Create Alarm'
    }.to change { Alarm.count }.by(1)
  end
end
