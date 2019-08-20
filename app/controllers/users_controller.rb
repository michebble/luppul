# frozen_string_literal: true

# Actions for Users
class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    context = CreateUser.call(user_params)
    # TODO handle what happens after cxreation or failure
  end

  def show
    current_schedule = current_user.schedules.order(created_at: :desc).first
    if current_schedule.nil? || current_schedule.completed_final_break_period?
      redirect_to new_schedule_path
      return
    end
    redirect_to schedule_path(current_schedule)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
