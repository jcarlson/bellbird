class AlarmsController < ApplicationController
  def index
    @alarms = Alarm.by_recency
  end

  def create
    Alarm.create! params.require(:alarm).permit(:text)
    redirect_to :index
  end

  def vote
    Alarm.vote_for! params[:id]
    redirect_to :index
  end
end
