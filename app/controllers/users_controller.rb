# frozen_string_literal: true

# Actions for Users
class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    result = CreateUser.call(user_params)
    if result.success?
      log_in result.user
      redirect_to user_path(result.user)
    else
      flash.now[:danger] = result.errors.first
      render 'new'
    end
  end

  def show
    current_schedule = current_user.schedules.order(created_at: :desc).first
    if current_schedule.nil?
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
