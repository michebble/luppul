# frozen_string_literal: true

# Schedule model
class Schedule < ApplicationRecord
  validates :level, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 11
  }

  belongs_to :user, inverse_of: :schedules
  has_many :sessions, inverse_of: :schedule

  def current_session
    sessions.first
  end

  LEVEL_MAP = {
    (0..3) => {
      level: 1,
      exercise: :negative_pull_up,
      sessions: [
        {
          sets: [2, 7, 5, 5, 7],
          break_days: 1
        },
        {
          sets: [3, 8, 6, 6, 8],
          break_days: 1
        },
        {
          sets: [4, 9, 6, 6, 8],
          break_days: 2
        },
        {
          sets: [5, 9, 7, 7, 9],
          break_days: 1
        },
        {
          sets: [5, 10, 8, 8, 10],
          break_days: 1
        },
        {
          sets: [6, 10, 8, 8, 12],
          break_days: 2
        }
      ]
    },
    (4..5) => {
      level: 2,
      exercise: :negative_pull_up,
      sessions: [
        {
          sets: [4, 9, 6, 6, 9],
          break_days: 1
        },
        {
          sets: [5, 9, 7, 7, 9],
          break_days: 1
        },
        {
          sets: [6, 10, 8, 8, 10],
          break_days: 2
        },
        {
          sets: [6, 11, 8, 8, 11],
          break_days: 1
        },
        {
          sets: [7, 12, 10, 10, 12],
          break_days: 1
        },
        {
          sets: [8, 14, 11, 11, 14],
          break_days: 2
        }
      ]
    },
    (6..8) => {
      level: 3,
      exercise: :pull_up,
      sessions: [
        {
          sets: [2, 3, 2, 2, 3],
          break_days: 1
        },
        {
          sets: [2, 3, 2, 2, 4],
          break_days: 1
        },
        {
          sets: [3, 4, 2, 2, 4],
          break_days: 2
        },
        {
          sets: [3, 4, 3, 3, 4],
          break_days: 1
        },
        {
          sets: [3, 5, 3, 3, 5],
          break_days: 1
        },
        {
          sets: [4, 5, 4, 4, 6],
          break_days: 2
        }
      ]
    },
    (9..11) => {
      level: 4,
      exercise: :pull_up,
      sessions: [
        {
          sets: [3, 5, 3, 3, 5],
          break_days: 1
        },
        {
          sets: [4, 6, 4, 4, 6],
          break_days: 1
        },
        {
          sets: [5, 7, 5, 5, 7],
          break_days: 2
        },
        {
          sets: [5, 8, 5, 5, 8],
          break_days: 1
        },
        {
          sets: [6, 9, 6, 6, 8],
          break_days: 1
        },
        {
          sets: [6, 9, 6, 6, 10],
          break_days: 2
        }
      ]
    },
    (12..15) => {
      level: 5,
      exercise: :pull_up,
      sessions: [
        {
          sets: [6, 8, 6, 6, 8],
          break_days: 1
        },
        {
          sets: [6, 9, 6, 6, 9],
          break_days: 1
        },
        {
          sets: [7, 10, 6, 6, 9],
          break_days: 2
        },
        {
          sets: [7, 10, 7, 7, 10],
          break_days: 1
        },
        {
          sets: [8, 11, 8, 8, 10],
          break_days: 1
        },
        {
          sets: [9, 11, 9, 9, 11],
          break_days: 2
        }
      ]
    },
    (16..20) => {
      level: 6,
      exercise: :pull_up,
      sessions: [
        {
          sets: [8, 11, 8, 8, 10],
          break_days: 1
        },
        {
          sets: [9, 12, 9, 9, 11],
          break_days: 1
        },
        {
          sets: [9, 13, 9, 9, 12],
          break_days: 2
        },
        {
          sets: [10, 14, 10, 10, 13],
          break_days: 1
        },
        {
          sets: [11, 15, 10, 10, 13],
          break_days: 1
        },
        {
          sets: [11, 15, 11, 11, 13],
          break_days: 2
        },
        {
          sets: [12, 16, 11, 11, 15],
          break_days: 1
        },
        {
          sets: [12, 16, 12, 12, 16],
          break_days: 1
        },
        {
          sets: [13, 17, 13, 13, 16],
          break_days: 2
        }
      ]
    },
    (21..25) => {
      level: 7,
      exercise: :pull_up,
      sessions: [
        {
          sets: [12, 16, 12, 12, 15],
          break_days: 1
        },
        {
          sets: [13, 16, 12, 12, 16],
          break_days: 1
        },
        {
          sets: [13, 17, 13, 13, 16],
          break_days: 2
        },
        {
          sets: [14, 19, 13, 13, 18],
          break_days: 1
        },
        {
          sets: [14, 19, 14, 14, 19],
          break_days: 1
        },
        {
          sets: [15, 20, 14, 14, 20],
          break_days: 2
        },
        {
          sets: [16, 20, 16, 16, 20],
          break_days: 1
        },
        {
          sets: [16, 21, 16, 16, 20],
          break_days: 1
        },
        {
          sets: [17, 22, 16, 16, 21],
          break_days: 2
        }
      ]
    },
    (26..30) => {
      level: 8,
      exercise: :pull_up,
      sessions: [
        {
          sets: [16, 18, 15, 15, 17],
          break_days: 1
        },
        {
          sets: [16, 20, 16, 16, 19],
          break_days: 1
        },
        {
          sets: [17, 21, 16, 16, 20],
          break_days: 2
        },
        {
          sets: [17, 22, 17, 17, 22],
          break_days: 1
        },
        {
          sets: [18, 23, 18, 18, 22],
          break_days: 1
        },
        {
          sets: [19, 25, 18, 18, 24],
          break_days: 2
        },
        {
          sets: [19, 26, 18, 18, 25],
          break_days: 1
        },
        {
          sets: [19, 27, 19, 19, 26],
          break_days: 1
        },
        {
          sets: [20, 28, 20, 20, 28],
          break_days: 2
        }
      ]
    },
    (31..35) => {
      level: 9,
      exercise: :pull_up,
      sessions: [
        {
          sets: [20, 25, 19, 19, 23],
          break_days: 1
        },
        {
          sets: [22, 25, 21, 21, 25],
          break_days: 1
        },
        {
          sets: [23, 26, 23, 23, 25],
          break_days: 2
        },
        {
          sets: [24, 27, 24, 24, 26],
          break_days: 1
        },
        {
          sets: [25, 28, 24, 24, 27],
          break_days: 1
        },
        {
          sets: [25, 29, 25, 25, 28],
          break_days: 2
        },
        {
          sets: [26, 29, 25, 25, 29],
          break_days: 1
        },
        {
          sets: [26, 30, 26, 26, 30],
          break_days: 1
        },
        {
          sets: [26, 32, 26, 26, 32],
          break_days: 2
        }
      ]
    },
    (36..40) => {
      level: 10,
      exercise: :pull_up,
      sessions: [
        {
          sets: [23, 27, 22, 22, 26],
          break_days: 1
        },
        {
          sets: [24, 28, 24, 24, 28],
          break_days: 1
        },
        {
          sets: [25, 29, 24, 24, 29],
          break_days: 2
        },
        {
          sets: [26, 30, 25, 25, 30],
          break_days: 1
        },
        {
          sets: [26, 31, 25, 25, 31],
          break_days: 1
        },
        {
          sets: [26, 31, 26, 26, 31],
          break_days: 2
        },
        {
          sets: [27, 31, 26, 26, 32],
          break_days: 1
        },
        {
          sets: [28, 32, 26, 26, 32],
          break_days: 1
        },
        {
          sets: [28, 34, 27, 27, 34],
          break_days: 2
        }
      ]
    },
    (41..50) => {
      level: 11,
      exercise: :pull_up,
      sessions: [
        {
          sets: [25, 28, 24, 24, 27],
          break_days: 1
        },
        {
          sets: [25, 29, 25, 25, 28],
          break_days: 1
        },
        {
          sets: [25, 30, 25, 25, 29],
          break_days: 2
        },
        {
          sets: [26, 31, 25, 25, 31],
          break_days: 1
        },
        {
          sets: [26, 32, 26, 26, 31],
          break_days: 1
        },
        {
          sets: [27, 32, 26, 26, 32],
          break_days: 2
        },
        {
          sets: [27, 34, 26, 26, 33],
          break_days: 1
        },
        {
          sets: [28, 34, 26, 26, 34],
          break_days: 1
        },
        {
          sets: [29, 35, 27, 27, 35],
          break_days: 2
        }
      ]
    }
  }.freeze
end
