require 'rails_helper'

RSpec.describe 'review creation', type: :feature do
  before(:each) do
    @bathroom = create(:bathroom)
    @user = create(:user, id: 14, image: "https://www.picuki.com/media/2259210751275656034")
    @review_1 = create(:review, bathroom_id: @bathroom.id, user_id: @user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    binding.pry
  end

  describe "when I visit the home show page" do
    it 'I see a link to add a review for a bathroom' do
      # binding.pry
      visit "/bathrooms/#{@bathroom.id}"
      
      click_on "Add Review"

      expect(current_path).to eq("/bathrooms/#{@bathroom.id}/reviews/new")
    end
  end 
end 