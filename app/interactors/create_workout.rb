# frozen_string_literal: true

# CreateWorkout
class CreateWorkout
  include Interactor

  delegate :schedule, to: :context

  def call
    break_days = BreakDaysService.call(schedule.workouts.count)
    workout = Workout.new(
      schedule_id: schedule.id,
      sets: Workout::SETS[schedule.level][schedule.workouts.count],
      start_date: DateTime.current.since(break_days)
    )
    if workout.save
      context.workout = workout
    else
      context.fail!(error: 'Unable to create workout')
    end
  end
end
