class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:edit, :update]
  before_action :move_to_index
  before_action :set_root, only: [:new, :edit]

  def index
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

  def edit
  end

  def update
    if @schedule.update(schedule_edit_params)
      redirect_to user_path(current_user.id)
    else
      render action: :edit
    end
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:from_time_sun, :to_time_sun, :from_time_mon, :to_time_mon, :from_time_tue, :to_time_tue, :from_time_wed, :to_time_wed, :from_time_thu, :to_time_thu, :from_time_fri, :to_time_fri, :from_time_sat, :to_time_sat, :location).merge(user_id: current_user.id)
  end

  def schedule_edit_params
    params.permit(:from_time_sun, :to_time_sun, :from_time_mon, :to_time_mon, :from_time_tue, :to_time_tue, :from_time_wed, :to_time_wed, :from_time_thu, :to_time_thu, :from_time_fri, :to_time_fri, :from_time_sat, :to_time_sat, :location).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def set_root
    redirect_to root_path if request.referer.nil?
  end
end
