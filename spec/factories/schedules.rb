# frozen_string_literal: true

FactoryBot.define do
  factory :schedule, class: 'Schedule' do
    user
    exercise { 0 }
    level { 1 }
  end
end
