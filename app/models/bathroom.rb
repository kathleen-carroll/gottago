class Bathroom < ApplicationRecord

  # def initialize(json)
  #   name = json[:name]
  #   street = json[:street]
  #   city = json[:city]
  #   state = json[:state]
  #   accessible = json[:accessible]
  #   unisex = json[:unisex]
  #   changing_table = json[:changing_table]
  #   latitude = json[:latitude]
  #   longitude = json[:longitude]
  # end

  def distance_to(lat, long, km=false)
    # Calculate radial arcs for latitude and longitude
    # require "pry"; binding.pry
    distance_lat = (latitude - lat) * Math::PI / 180
    distance_long = (longitude - long) * Math::PI / 180


    a = Math.sin(distance_lat / 2) *
        Math.sin(distance_lat / 2) +
        Math.cos(lat * Math::PI / 180) *
        Math.cos(lat * Math::PI / 180) *
        Math.sin(distance_long / 2) * Math.sin(distance_long / 2)

    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

    d = 3958.8 * c
  end

  def self.advanced_search(search_terms)
    coordinates = Bathroom.get_coordinates(search_terms)
    location_lat = coordinates[:lat]
    location_long = coordinates[:lng]
    distance = search_terms[:distance]
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

  def self.get_coordinates(search_terms)
    query = "#{search_terms[:address]} #{search_terms[:city]}, #{search_terms[:state]} #{search_terms[:zip]}"
    conn = Faraday.new(url:"https://maps.googleapis.com/maps/api/geocode/json?address=#{query}&key=#{ENV['GOOGLE_API_KEY']}")
    response = conn.post
    location = JSON.parse(response.body, symbolize_names: true)
    location[:results].first[:geometry][:location]
  end
end
