FactoryBot.define do
  factory :bathroom do
    name           { Faker::Restaurant.name }
    street         { Faker::Address.street_address }
    city           { Faker::Address.city }
    state          { Faker::Address.state }
    accessible     { Faker::Boolean.boolean(true_ratio: 0.8) }
    unisex         { Faker::Boolean.boolean(true_ratio: 0.6) }
    changing_table { Faker::Boolean.boolean(true_ratio: 0.2) }
    latitude       {  }
    longitude      {  }
  end
end
