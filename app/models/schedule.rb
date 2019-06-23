# frozen_string_literal: true

# Schedule determines the amount of sessions and amount of pullups in sets
class Schedule < ApplicationRecord
  validates :level, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 11
  }

  belongs_to :user, inverse_of: :schedules
end
