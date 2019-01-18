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

  scenario 'vote for alarm' do
    visit '/index'

    expect {
      within("#edit_alarm_#{alarm1.id}") { click_on '+1' }
    }.to change { page.find("#alarm_#{alarm1.id}_votes").text }
           .from('0').to('1')
           .and change { alarm1.reload.votes }.from(0).to(1)
  end
end
