class BathroomsController < ApplicationController
  def show
    @bathroom = Bathroom.find(params[:id])
  end

  def new
  end

  def create
    bathroom_latitude = get_coordinates[:lat]
    bathroom_longitude = get_coordinates[:lng]
    bathroom = Bathroom.create(bathroom_params)
    bathroom.update_attributes(latitude: bathroom_latitude, longitude: bathroom_longitude)
    if bathroom.save
      redirect_to "/bathrooms/#{bathroom.id}"
    else
      flash[:error] = bathroom.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def bathroom_params
    params.permit(:name, :street, :city, :state, :accessible, :changing_table, :unisex)
  end

  def get_coordinates
    query = "#{params[:street]} #{params[:city]}, #{params[:state]} #{params[:zip]}"

    GeocodeService.new.geocall(query)
  end
end
