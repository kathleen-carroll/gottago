class MapController < ApplicationController
  def index
    @user = User.find(session[:user_id])

    # if @user.latitude.nil?
    #   current = @user.address
    #   @user.update(latitude: current[:location][:lat], longitude: current[:location][:lng])
    # end

    @bathrooms = Bathroom.all
    #.include(:reviews)
  end
end
