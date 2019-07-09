# frozen_string_literal: true

# Session model
class Session < ApplicationRecord
  validate :start_date

  belongs_to :schedule, inverse_of: :sessions
end
