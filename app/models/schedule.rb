# frozen_string_literal: true

# Schedule determines the amount of sessions and amount of pullups in sets
class Schedule < ApplicationRecord
  validates :level, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 11
  }

  belongs_to :user, inverse_of: :schedules

  LEVEL_MAP = {
    (0..3) => 1,
    (4..5) => 2,
    (6..8) => 3,
    (9..11) => 4,
    (12..15) => 5,
    (16..20) => 6,
    (21..25) => 7,
    (26..30) => 8,
    (31..35) => 9,
    (36..40) => 10,
    (41..50) => 11
  }.freeze
end
