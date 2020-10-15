class SchedulesController < ApplicationController

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:w_day_id, :from_time_id, :to_time_id, :location)
  end

  
end
