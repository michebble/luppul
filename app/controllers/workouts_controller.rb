# frozen_string_literal: true

# Actions for Workouts
class WorkoutsController < ApplicationController
  START_DATE = DateTime.current

  def show
    @workout = Workout.find(params[:id])
  end

  def create
    workout = Workout.find(params[:id])
    workout.update(completed_at: DateTime.current)

    schedule = workout.schedule
    sets = Workout::SETS[schedule.level]

    if schedule.workouts.count == sets.count
      schedule.update(completed_at: DateTime.current)
      redirect_to new_schedule_path
    else
      CreateWorkout.call(schedule: schedule)

      redirect_to schedule_path(schedule)
    end
  end
end
