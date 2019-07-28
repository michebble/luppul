# frozen_string_literal: true

# Session model
class Session < ApplicationRecord
  validates :sets, :start_date, presence: true

  belongs_to :schedule, inverse_of: :sessions

  delegate :exercise, to: :schedule

  def human_start_date
    start_date.strftime("#{start_date.day.ordinalize} of %B")
  end
end
