class SessionsController < ApplicationController
  def new
  end

  def create
    result = CreateSession.call(session_params)
    if result.success?
      log_in result.user
      redirect_to schedules_path
    else
      flash.now[:danger] = result.errors.first
      render 'new'
    end
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
