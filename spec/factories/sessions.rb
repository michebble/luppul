# frozen_string_literal: true

FactoryBot.define do
  factory :session do
    schedule
    start_date { '2019-07-06' }
  end
end
