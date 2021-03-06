# frozen_string_literal: true

# Workout model
class Workout < ApplicationRecord
  validates :sets, :start_date, presence: true

  belongs_to :schedule, inverse_of: :workouts

  delegate :exercise, to: :schedule

  SETS = [
    [[2, 7, 5, 5, 7], [3, 8, 6, 6, 8], [4, 9, 6, 6, 8], [5, 9, 7, 7, 9], [5, 10, 8, 8, 10], [6, 10, 8, 8, 12]],
    [[4, 9, 6, 6, 9], [5, 9, 7, 7, 9], [6, 10, 8, 8, 10], [6, 11, 8, 8, 11], [7, 12, 10, 10, 12], [8, 14, 11, 11, 14]],
    [[2, 3, 2, 2, 3], [2, 3, 2, 2, 4], [3, 4, 2, 2, 4], [3, 4, 3, 3, 4], [3, 5, 3, 3, 5], [4, 5, 4, 4, 6]],
    [[3, 5, 3, 3, 5], [4, 6, 4, 4, 6], [5, 7, 5, 5, 7], [5, 8, 5, 5, 8], [6, 9, 6, 6, 8], [6, 9, 6, 6, 10]],
    [[6, 8, 6, 6, 8], [6, 9, 6, 6, 9], [7, 10, 6, 6, 9], [7, 10, 7, 7, 10], [8, 11, 8, 8, 10], [9, 11, 9, 9, 11]],
    [[8, 11, 8, 8, 10], [9, 12, 9, 9, 11], [9, 13, 9, 9, 12], [14, 19, 13, 13, 18], [14, 19, 14, 14, 19], [15, 20, 14, 14, 20], [16, 20, 16, 16, 20], [16, 21, 16, 16, 20], [17, 22, 16, 16, 21]],
    [[16, 18, 15, 15, 17], [16, 20, 16, 16, 19], [17, 21, 16, 16, 20], [17, 22, 17, 17, 22], [18, 23, 18, 18, 22], [19, 25, 18, 18, 24], [19, 26, 18, 18, 25], [19, 27, 19, 19, 26], [20, 28, 20, 20, 28]],
    [[20, 25, 19, 19, 23], [22, 25, 21, 21, 25], [23, 26, 23, 23, 25], [24, 27, 24, 24, 26], [25, 28, 24, 24, 27], [25, 29, 25, 25, 28], [26, 29, 25, 25, 29], [26, 30, 26, 26, 30], [26, 32, 26, 26, 32]],
    [[23, 27, 22, 22, 26], [24, 28, 24, 24, 28], [25, 29, 24, 24, 29], [26, 30, 25, 25, 30], [26, 31, 25, 25, 31], [26, 31, 26, 26, 31], [27, 31, 26, 26, 32], [28, 32, 26, 26, 32], [28, 34, 27, 27, 34]],
    [[25, 28, 24, 24, 27], [25, 29, 25, 25, 28], [25, 30, 25, 25, 29], [26, 31, 25, 25, 31], [26, 32, 26, 26, 31], [27, 32, 26, 26, 32], [27, 34, 26, 26, 33], [28, 34, 26, 26, 34], [29, 35, 27, 27, 35]],
  ].freeze

  def human_start_date
    start_date.strftime("#{start_date.day.ordinalize} of %B")
  end
end
