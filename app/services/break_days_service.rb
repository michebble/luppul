# frozen_string_literal: true

# BreakDaysService
class BreakDaysService
  ONE_BREAK_DAY = 1.days.freeze
  TWO_BREAK_DAYS = 2.days.freeze

  private_constant :ONE_BREAK_DAY, :TWO_BREAK_DAYS

  class << self
    def call(session_count)
      return TWO_BREAK_DAYS if session_count.zero?

      current_session = session_count + 1
      (current_session % 3).zero? ? TWO_BREAK_DAYS : ONE_BREAK_DAY
    end
  end
end
