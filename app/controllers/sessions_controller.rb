# frozen_string_literal: true

# Actions for Sessions
class SessionsController < ApplicationController
  START_DATE = DateTime.current

  def show
    @session = Session.find(params[:id])
  end

  def create
    session = Session.find(params[:id])
    session.update(completed_at: DateTime.current)

    schedule = session.schedule
    sets = Session::SETS[schedule.level]

    if schedule.sessions.count == sets.count
      schedule.update(completed_at: DateTime.current)
      redirect_to new_schedule_path
    else
      CreateSession.call(schedule: schedule)

      redirect_to schedule_path(schedule)
    end
  end
end
