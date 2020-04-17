class Bathroom < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates_presence_of :name,
                        :street,
                        :city,
                        :state,
                        :latitude,
                        :longitude

  def distance_to(lat, long)
    distance_lat = (latitude - lat) * Math::PI / 180
    distance_long = (longitude - long) * Math::PI / 180

    a = Math.sin(distance_lat / 2) * Math.sin(distance_lat / 2) +
        Math.cos(lat * Math::PI / 180) * Math.cos(lat * Math::PI / 180) *
        Math.sin(distance_long / 2) * Math.sin(distance_long / 2)

    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

    d = 3958.8 * c

    d.round(3)
  end
end
