class MapController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    current = @user.address
    @user.update(lat: current[:location][:lat], long: current[:location][:lng])

    @bathrooms = Bathroom.raw_data
  end
end
