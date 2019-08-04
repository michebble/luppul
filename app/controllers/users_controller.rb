# frozen_string_literal: true

# Actions for Users
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    context = CreateUser.call(user_params)
    # TODO handle what happens after cxreation or failure
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

