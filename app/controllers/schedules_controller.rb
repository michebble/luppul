# frozen_string_literal: true

# Actions for Schedules
class SchedulesController < ApplicationController
  def index
    schedule = Schedule.where(user_id: 1).order(created_at: :desc).first

    redirect_to schedule.nil? ? new_schedule_path : schedule_path(schedule)
  end

  def create
    schedule = Schedule.create(user_id: 1, level: level_map(params[:result]))

    redirect_to schedule_path(schedule)
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  private

  def level_map(pullups)
    Schedule::LEVEL_MAP
      .find { |range, _| range.cover?(pullups.to_i) }
      .last[:level]
  end
end
