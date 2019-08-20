class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user) if logged_in?
  end

  def create
    result = CreateSession.call(session_params)
    if result.success?
      log_in result.user
      redirect_to user_path(result.user)
    else
      flash.now[:danger] = result.errors.first
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
