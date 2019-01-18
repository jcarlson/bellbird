class AlarmsController < ApplicationController
  def index
    @alarms = Alarm.all
  end

  def create
    @alarm = Alarm.create! params.require(:alarm).permit(:text)
    redirect_to :index
  end
end
