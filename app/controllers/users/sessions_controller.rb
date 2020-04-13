class Users::SessionsController < ApplicationController
  def destroy
    reset_session
    User.destroy_all

    redirect_to root_path
  end
end
