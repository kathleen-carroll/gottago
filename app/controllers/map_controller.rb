class MapController < ApplicationController
  def index
    @user = User.last  #User.find(session[:user_id])
    current = @user.address
    # require "pry"; binding.pry
    @user.update(lat: current[:location][:lat], long: current[:location][:lng])
    # @user.to_coordinates
  end
end
