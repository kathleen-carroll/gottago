class MapController < ApplicationController
  def index
    # require "pry"; binding.pry

    if !current_user
      redirect_to root_path
    end

    @user = current_user #User.find(session[:user_id])

    # current_user.update(latitude: params["lat"].to_f, longitude: params["lat"].to_f)

    if session[:advanced] == true
      @bathrooms = Bathroom.advanced_search(search_terms)
      session[:advanced] = false
    else
      @bathrooms = Bathroom.all[0..15]
    end
  end

  private

  def search_terms
    params.permit(:address, :city, :state, :zip, :distance, :accessible, :changing_table, :unisex)
  end
end
