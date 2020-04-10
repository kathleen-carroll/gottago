class MapController < ApplicationController
  def index
    @user = User.find(session[:user_id]) #User.last
    current = @user.address
    # require "pry"; binding.pry
    @user.update(lat: current[:location][:lat], long: current[:location][:lng])
    # @user.to_coordinates
  end
end
