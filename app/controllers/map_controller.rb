class MapController < ApplicationController
  def index
    @user = User.find(session[:user_id]) #User.last
    current = @user.address
    @user.update(lat: current[:location][:lat], long: current[:location][:lng])
  end
end
