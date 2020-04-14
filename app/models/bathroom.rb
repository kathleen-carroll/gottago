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

  def self.raw_data
    Bathroom.all.map do |bathroom|
      [bathroom.name, bathroom.latitude, bathroom.longitude]
    end
  end

end
