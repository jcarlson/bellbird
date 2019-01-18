require 'rails_helper'

RSpec.describe 'Alarms Index' do
  fixtures :alarms

  let(:alarm1) { alarms(:one) }
  let(:alarm2) { alarms(:two) }

  scenario 'visit alarm index' do
    visit '/index'

    expect(page).to have_text("#{alarm1.id} -- #{alarm1.text}")
    expect(page).to have_text("#{alarm2.id} -- #{alarm2.text}")
  end
end
