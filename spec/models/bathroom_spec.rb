require 'rails_helper'

describe Bathroom, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :street }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :longitude }
  end

  describe "relationships" do
    it {should have_many :reviews}
  end

  describe 'instance methods' do
    before(:each) do
      @bathroom = create(:bathroom, latitude: 39.741692, longitude: -104.985210)
    end

    it 'distance_to()' do
      expect(@bathroom.distance_to(39.734432, -104.952766)).to eq(1.795)
    end
  end
end
