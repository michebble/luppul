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
    schedule_plan = Schedule::PLANS[schedule.level]

    if schedule.sessions.count == schedule_plan[:sessions].count
      schedule.update(completed_at: DateTime.current)
      redirect_to new_schedule_path
    else
      Session.create(
        schedule_id: schedule.id,
        exercise: schedule_plan[:exercise],
        sets: schedule_plan[:sessions][schedule.sessions.count][:sets],
        start_date: START_DATE
      )

      redirect_to schedule_path(schedule)
    end
  end
end
