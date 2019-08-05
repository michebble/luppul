# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:schedules).class_name('Schedule') }
  end

  describe 'Validations' do
    it 'has a valid factory' do
      user = build(:user)
      expect(user).to be_valid
    end

    describe ':password' do
      it { should validate_length_of(:password).is_at_least(8) }

      invalid_passwords = %w[qwertyui 123456789 T56787989].freeze
      invalid_passwords.each do |password|
        it { should_not allow_value(password).for(:password) }
      end

      valid_passwords = %w[Password!2 hjsyu67T@./j].freeze
      valid_passwords.each do |password|
        it { should allow_value(password).for(:password) }
      end
    end

    describe ':email' do
      it { should validate_presence_of :email }
      it { should validate_uniqueness_of(:email).case_insensitive }

      invalid_emails = %w[user@example,com user_at_foo.org user.name@example.
                          foo@bar_baz.com foo@bar+baz.com user@nonwhitelisteddomain.com].freeze
      invalid_emails.each do |email|
        it { should_not allow_value(email).for(:email) }
      end

      valid_emails = %w[user@ user.name@].freeze
      valid_emails.each do |email|
        it { should allow_value(email + ENV['WHITELISTED_EMAIL_DOMAIN']).for(:email) }
      end
    end
  end
end
