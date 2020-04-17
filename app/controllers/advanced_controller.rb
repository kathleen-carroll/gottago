class AdvancedController < ApplicationController

  def index
    @bathrooms = Bathroom.advanced_search(search_terms)
  end

  def new
    session[:advanced] = true
    @user = User.find(session[:user_id])
  end

end
