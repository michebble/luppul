# frozen_string_literal: true

# Actions for Schedules
class SchedulesController < ApplicationController
  def index
    schedule = Schedule.where(user_id: 1).order(created_at: :desc).first

    redirect_to schedule.nil? ? new_schedule_path : schedule_path(schedule)
  end

  def create
    settings = level_map(params[:result])
    schedule = Schedule.create(user_id: 1, level: settings[:level])
    Session.create(
      schedule_id: schedule.id,
      exercise: settings[:exercise],
      sets: settings[:sessions].first[:sets],
      start_date: 2.days.since(Time.current)
    )
    redirect_to schedule_path(schedule)
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  private

  def level_map(pullups)
    Schedule::LEVEL_MAP
      .find { |range, _| range.cover?(pullups.to_i) }
      .last
  end
end
