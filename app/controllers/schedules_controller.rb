# frozen_string_literal: true

# Actions for Schedules
class SchedulesController < ApplicationController
  def show
    user = User.find(1)
    redirect_to new_schedule_path if user.schedules.empty?
    @schedule = user.schedules.first
  end

  def create
    @schedule = Schedule.create(user_id: 1, level: level_map(params[:result]))
  end

  private

  def level_map(pullups)
    Schedule::LEVEL_MAP.find { |range, _| range.cover?(pullups.to_i) }.last[:level]
  end
end
