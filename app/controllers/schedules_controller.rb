class SchedulesController < ApplicationController
  def index
    @schedule = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.create(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      @schedule = Schedule.new
      render action: :new
    end
  end

  def show
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
  end

  private

  def schedule_params
    params.require(:schedule).permit(:from_time_sun, :to_time_sun, :from_time_mon, :to_time_mon, :from_time_tue, :to_time_tue, :from_time_wed, :to_time_wed, :from_time_thu, :to_time_thu, :from_time_fri, :to_time_fri, :from_time_sat, :to_time_sat, :location).merge(user_id: current_user.id)
  end
end
