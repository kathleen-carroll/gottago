class MapController < ApplicationController
  def index

    @user = User.find(session[:user_id])

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
