# frozen_string_literal: true

# Actions for Schedules
class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end

  def create
    result = StartNewSchedule.call(user_id: current_user.id, pull_ups: params[:result].to_i)

    redirect_to schedule_path(result.schedule)
  end

  def show
    @schedule = Schedule.find(params[:id])

    render :period_before_test if @schedule.in_final_break_period?
  end

  private

  def days_since_completed(completed_at)
    TimeDifference.between(completed_at, Time.current).in_days
  end
end
