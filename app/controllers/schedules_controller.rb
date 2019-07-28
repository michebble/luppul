# frozen_string_literal: true

# Actions for Schedules
class SchedulesController < ApplicationController
  START_DATE = DateTime.current

  def index
    schedule = Schedule.where(user_id: 1, completed_at: nil)
                       .order(created_at: :desc).first

    redirect_to schedule.nil? ? new_schedule_path : schedule_path(schedule)
  end

  def create
    result = CreateSchedule.call(user_id: 1, level: find_level(params[:result]))

    CreateSession.call(schedule: result.schedule)

    redirect_to schedule_path(result.schedule)
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  private

  def find_level(pullups)
    Schedule::LEVELS.find_index { |range| range.cover?(pullups.to_i) }
  end
end
