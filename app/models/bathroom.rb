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

end
