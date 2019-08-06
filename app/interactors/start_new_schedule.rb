# frozen_string_literal: true

# StartNewSchedule
class StartNewSchedule
  include Interactor::Organizer

  organize CreateSchedule, CreateWorkout

  # around do |interactor|
  #   ActiveRecord::Base.transaction do
  #     interactor.call(sale_data)
  #   end
  # end
end
