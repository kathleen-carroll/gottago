class MapController < ApplicationController
  def index
    # require "pry"; binding.pry
    @user = User.last
  end
end
