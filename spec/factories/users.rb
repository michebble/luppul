# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "#{Faker::Internet.username(separators: '.')}@#{ENV['WHITELISTED_EMAIL_DOMAIN']}" }
    password { 'Password!2' }
  end
end
