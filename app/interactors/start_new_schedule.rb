# frozen_string_literal: true

# StartNewSchedule
class StartNewSchedule
  include Interactor::Organizer

  organize CreateSchedule, CreateSession

  # around do |interactor|
  #   ActiveRecord::Base.transaction do
  #     interactor.call(sale_data)
  #   end
  # end
end
