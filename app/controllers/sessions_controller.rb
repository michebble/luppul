# frozen_string_literal: true

# Actions for Sessions
class SessionsController < ApplicationController
  def show
    @session = Session.find(params[:id])
  end
end
