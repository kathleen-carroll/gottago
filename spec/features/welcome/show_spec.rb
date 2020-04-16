require 'rails_helper'

RSpec.describe 'As a visitor to site' do
  it 'should show welcome and login option' do
    visit '/'

    expect(page).to have_content("Welcome to Gotta Go!")
    expect(page).to have_link("Sign in with Facebook")
  end
end
