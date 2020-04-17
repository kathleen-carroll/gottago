require 'rails_helper'

RSpec.describe "bathroom's show page", type: :feature do
  before(:each) do
    @bathroom = create(:bathroom)
    @user = create(:user)
    @review_1 = create(:review, bathroom_id: @bathroom.id, user_id: @user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  it "shows bathroom's info" do
    visit map_index_path
    
    expect(page).to have_link("Get Directions")
    click_link(@bathroom.name)
    
    expect(current_path).to eq("/bathrooms/#{@bathroom.id}") 

    within "#bathroom" do
      expect(page).to have_content(@bathroom.name)
      expect(page).to have_content("Accessible?")
      expect(page).to have_content("Unisex?")
      expect(page).to have_content("Changing Table?")
      expect(page).to have_link("Add Review")
    end 
  end
end 