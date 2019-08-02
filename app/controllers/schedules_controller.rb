# frozen_string_literal: true

# Actions for Schedules
class SchedulesController < ApplicationController
  def index
    schedule = Schedule.where(user_id: 1, completed_at: nil)
                       .order(created_at: :desc).first

    redirect_to schedule.nil? ? new_schedule_path : schedule_path(schedule)
  end

  def create
    result = StartNewSchedule.call(user_id: 1, pull_ups: params[:result].to_i)

    redirect_to schedule_path(result.schedule)
  end

  def show
    @schedule = Schedule.find(params[:id])
  end
end
