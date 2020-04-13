class Users::SessionsController < ApplicationController
  def destroy
    # require "pry"; binding.pry
    reset_session
    User.destroy_all

    redirect_to root_path
  end
end
