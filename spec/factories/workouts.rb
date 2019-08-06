# frozen_string_literal: true

FactoryBot.define do
  factory :workout do
    schedule
    sets { [1, 2, 2, 2, 2] }
    start_date { '2019-07-06' }
  end
end
