# frozen_string_literal: true

# Session model
class Session < ApplicationRecord
  validates :exercise, :sets, :start_date, presence: true

  belongs_to :schedule, inverse_of: :sessions

  enum exercise: { pull_ups: 0, negative_pull_ups: 1 }

  def human_start_date
    start_date.strftime("#{start_date.day.ordinalize} of %B")
  end
end
