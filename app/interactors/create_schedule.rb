# frozen_string_literal: true

# CreateSchedule
class CreateSchedule
  include Interactor

  delegate :user_id, :pull_ups, to: :context

  def call
    level = Schedule::LEVELS.find_index { |range| range.cover?(pull_ups.to_i) }
    exercise = SelectExerciseService.call(level)
    schedule = Schedule.new(user_id: user_id, level: level, exercise: exercise)
    if schedule.save
      context.schedule = schedule
    else
      context.fail!(error: 'Unable to create Schedule')
    end
  end
end
