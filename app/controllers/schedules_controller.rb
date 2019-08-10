# frozen_string_literal: true

# Actions for Schedules
class SchedulesController < ApplicationController
  def index
    schedule = Schedule.where(user_id: current_user.id).order(created_at: :desc).first

    if schedule.completed_at.nil?
      redirect_to schedule_path(schedule) and return
    elsif days_since_completed(schedule.completed_at) >= 2
      redirect_to new_schedule_path and return
    end
    render 'please_wait'
  end

  def create
    result = StartNewSchedule.call(user_id: current_user.id, pull_ups: params[:result].to_i)

    redirect_to schedule_path(result.schedule)
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  private

  def days_since_completed(completed_at)
    TimeDifference.between(completed_at, Time.current).in_days
  end
end
