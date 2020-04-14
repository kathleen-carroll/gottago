class MapController < ApplicationController
  def index
    @user = User.find(session[:user_id])

    if !@user.lat.nil?
      current = @user.address
      @user.update(lat: current[:location][:lat], long: current[:location][:lng])
    end

    # @raw_bathrooms = Bathroom.raw_data
    @bathrooms = Bathroom.all
  end
end
