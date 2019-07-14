# frozen_string_literal: true

FactoryBot.define do
  factory :session do
    schedule
    exercise { 0 }
    sets { [1, 2, 2, 2, 2] }
    start_date { '2019-07-06' }
  end
end
