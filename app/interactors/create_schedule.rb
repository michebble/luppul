# frozen_string_literal: true

# CreateSchedule
class CreateSchedule
  include Interactor

  delegate :user_id, :level, to: :context

  def call
    schedule = Schedule.new(user_id: user_id, level: level)
    if schedule.save
      context.schedule = schedule
    else
      context.fail!(error: 'Unable to create Schedule')
    end
  end
end
