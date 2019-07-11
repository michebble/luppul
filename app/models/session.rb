# frozen_string_literal: true

# Session model
class Session < ApplicationRecord
  validate :start_date

  belongs_to :schedule, inverse_of: :sessions

  def human_start_date
    start_date.strftime("#{start_date.day.ordinalize} of %B")
  end
end
