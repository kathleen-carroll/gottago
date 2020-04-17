class MapController < ApplicationController
  def index
    if !current_user
      redirect_to root_path
    end

    @user = current_user
    if session[:advanced] == true && !search_terms.empty?
      @bathrooms = advanced_search(search_terms)[1..20]
      session[:advanced] = false
    else
      @bathrooms = Bathroom.all.limit(20)
    end
  end

  private

  def search_terms
    params.permit(:address, :city, :state, :zip, :distance, :accessible, :changing_table, :unisex)
  end

  def advanced_search(search_terms)
    coordinates = get_coordinates(search_terms)
    location_lat = coordinates[:lat]
    location_long = coordinates[:lng]
    distance = search_terms[:distance].to_f
    accessible = search_terms[:accessible]
    unisex = search_terms[:unisex]
    changing_table = search_terms[:changing_table]

    results = Bathroom.all.select { |bathroom|
      bathroom.distance_to(location_lat, location_long) < distance
    }

    if accessible != "nil"
      results = results.find_all { |bathroom|
        bathroom.accessible == accessible
      }
    end

    if unisex != "nil"
      results = results.find_all { |bathroom|
        bathroom.unisex == unisex
      }
    end

    if changing_table != "nil"
      results = results.find_all { |bathroom|
        bathroom.changing_table == changing_table
      }
    end

    results
  end

  def get_coordinates(search_terms)
    query = "#{search_terms[:address]} #{search_terms[:city]}, #{search_terms[:state]} #{search_terms[:zip]}"

    GeocodeService.new.geocall(query)
  end
end
