# frozen_string_literal: true

# Schedule determines the amount of sessions and amount of pullups in sets
class Schedule < ApplicationRecord
  belongs_to :user, inverse_of: :schedules
end
