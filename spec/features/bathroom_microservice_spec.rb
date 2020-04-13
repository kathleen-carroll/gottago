require 'rails_helper'

describe 'as a user' do

  it 'can return bathrooms within a certain radius' do
    loc_lat = 39.737846
    loc_long = -104.960767
    bath1 = create(:bathroom, latitude: 39.7397941, longitude: -104.9566365)
    bath2 = create(:bathroom, latitude: 39.7433379, longitude: -104.9629723)
    bath3 = create(:bathroom, latitude: 39.7355773, longitude: -104.945803)
    bath4 = create(:bathroom, latitude: 39.7399701, longitude: -104.9845178)
    bath5 = create(:bathroom, latitude: 39.7255578, longitude: -104.9862614)

    list = Bathroom.all.select { |bathroom| bathroom.distance_to(loc_lat, loc_long) < 0.5 }

    require "pry"; binding.pry

    expect(list.count).to eq(2)
    # require "pry"; binding.pry
  end

end
