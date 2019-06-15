# frozen_string_literal: true

# User tracks who is doing which work out
class User < ApplicationRecord
  has_many :schedules, inverse_of: :user
end
