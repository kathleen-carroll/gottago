class MapController < ApplicationController
  def index
    @user = User.find(session[:user_id])

    if !@user.latitude.nil?
      current = @user.address
      @user.update(latitude: current[:location][:lat], longitude: current[:location][:lng])
    else
      @user.update(latitude: 39.753203, longitude: -104.999729)
    end

    # @raw_bathrooms = Bathroom.raw_data
    @bathrooms = Bathroom.all
  end
end
