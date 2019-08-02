# frozen_string_literal: true

# CreateSession
class CreateSession
  include Interactor

  delegate :schedule, to: :context

  def call
    break_days = BreakDaysService.call(schedule.sessions.count)
    session = Session.new(
      schedule_id: schedule.id,
      sets: Session::SETS[schedule.level][schedule.sessions.count],
      start_date: DateTime.current.since(break_days)
    )
    if session.save
      context.session = session
    else
      context.fail!(error: 'Unable to create session')
    end
  end
end
