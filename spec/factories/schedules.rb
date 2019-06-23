# frozen_string_literal: true

FactoryBot.define do
  factory :schedule, class: 'Schedule' do
    user
    level { 1 }
  end
end
