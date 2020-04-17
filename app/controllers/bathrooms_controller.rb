class BathroomsController < ApplicationController
  def show
    @bathroom = Bathroom.find(params[:id])
  end

  def new
  end

  def create
    require "pry"; binding.pry
    bathroom = Bathroom.create(item_params)
    if bathroom.save
      redirect_to "/bathrooms/#{@bathroom.id}"
    else
      flash[:error] = bathroom.errors.full_messages.to_sentence
      render :new
    end
  end
end
