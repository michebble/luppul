# frozen_string_literal: true

# SelectExerciseService
class SelectExerciseService
  class << self
    def call(level)
      level <= 1 ? Schedule.exercises.fetch(:negative_pull_ups) : Schedule.exercises.fetch(:pull_ups)
    end
  end
end
