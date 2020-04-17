class MapController < ApplicationController
  def index
    @user = User.find(session[:user_id])

    if @user.latitude.nil?
      current = @user.address
      @user.update(latitude: current[:location][:lat], longitude: current[:location][:lng])
    end
    if session[:advanced] == true
      @bathrooms = Bathroom.advanced_search(search_terms)
      session[:advanced] = false
    else
      @bathrooms = Bathroom.all
    end
  end

  private

  def search_terms
    params.permit(:address, :city, :state, :zip, :distance, :accessible, :changing_table, :unisex)
  end
end
