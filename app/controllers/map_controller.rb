class MapController < ApplicationController
  def index
    @user = User.last
  end
end
