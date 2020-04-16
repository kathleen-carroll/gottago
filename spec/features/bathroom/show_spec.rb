require 'rails_helper'

RSpec.describe 'As a logged in user' do
  before(:each) do
    @bathroom1 = create(:bathroom)
    user = create(:user, password: 'burgers') #, token: ENV["FB_TEST_TOKEN"]
    sign_in user
    # @user =
    # fb = Faker::Omniauth.facebook #=>
    # {
    #   provider: 'facebook',
    #   uid: '1234567',
    #   info: {
    #     email: 'joe_bloggs@example.com',
    #     name: 'Joe Bloggs',
    #     first_name: 'Joe',
    #     last_name: 'Bloggs',
    #     image: 'http://graph.facebook.com/1234567/picture?type=square',
    #     verified: true
    #   },
    #   credentials: {
    #     token: 'ABCDEF...',
    #     expires_at: 1321747205,
    #     expires: true
    #   },
    #   extra: {
    #     raw_info: {
    #       id: '1234567',
    #       name: 'Joe Bloggs',
    #       first_name: 'Joe',
    #       last_name: 'Bloggs',
    #       link: 'http://www.facebook.com/jbloggs',
    #       username: 'jbloggs',
    #       location: { id: '123456789', name: 'Palo Alto, California' },
    #       gender: 'male',
    #       email: 'joe_bloggs@example.com',
    #       timezone: -8,
    #       locale: 'en_US',
    #       verified: true,
    #       updated_time: '2011-11-11T06:21:03+0000',
    #     }
    #   }
    # }
    # require "pry"; binding.pry
    # @user = create(:user)
    # OmniAuth.config.add_mock(:facebook, fb)

    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  xit 'should show map and bathrooms near by' do
    visit '/'

    click_on "Sign in with Facebook"

    visit '/map'

    expect(page).to have_content("Bathrooms")
    expect(page).to have_link("Get Directions")
  end

  xit 'should return show page' do
    visit '/map'

    click_on "#{@bathroom1.name}"

    expect(page).to have_content("#{@bathroom1.name}")
    expect(page).to have_content("#{@bathroom1.street}")
  end
end
