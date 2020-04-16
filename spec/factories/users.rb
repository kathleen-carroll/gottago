FactoryBot.define do
  factory :user do
    email           { Faker::Internet.email }
    provider        { Faker::Company.name }
    uid             { Faker::Address.city }
    name            { Faker::FunnyName.name }
    image           { Faker::Placeholdit.image }
    # reset_password_token      { Faker::Internet.password }
    latitude       {  }
    longitude      {  }
  end
end
