class UpcaseAlarmText < ActiveRecord::Migration[5.2]
  def change
    Alarm.all.each {|alarm| alarm.update_attribute :text, alarm.text.upcase }
  end
end
