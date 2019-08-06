# frozen_string_literal: true

# User tracks who is doing which work out
class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@#{ENV['WHITELISTED_EMAIL_DOMAIN']}/i.freeze
  VALID_PASSWORD_REGEX = /^.*(?=.{8,})((?=.*[!@#$%^&*()\-_=+{};:,<.>]){1})(?=.*\d)((?=.*[a-z]){1})((?=.*[A-Z]){1}).*$/.freeze

  private_constant :VALID_EMAIL_REGEX, :VALID_PASSWORD_REGEX

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }

  validate :password_complexity

  def password_complexity
    return if password.blank? || password =~ VALID_PASSWORD_REGEX

    errors.add :password, 'must contain at least 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end

  has_many :schedules, inverse_of: :user
end
