# frozen_string_literal: true

# Schedule model
class Schedule < ApplicationRecord
  validates :level, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10
  }
  validates :exercise, presence: true

  belongs_to :user, inverse_of: :schedules
  has_many :workouts, inverse_of: :schedule

  enum exercise: { negative_pull_ups: 0, pull_ups: 1 }

  def current_workout
    workouts.find_by(completed_at: nil)
  end

  LEVELS = [
    (0..3),
    (4..5),
    (6..8),
    (9..11),
    (16..20),
    (21..25),
    (26..30),
    (31..35),
    (36..40),
    (41..50)
  ].freeze
end
