FactoryBot.define do
  factory :user, class: User do
    name { Faker::TvShows::Simpsons.character  }
    email { Faker::Internet.email }
    created_at {Faker::Date.between(from: 6.days.ago, to: Date.today)}
    password {password = Faker::Internet.password}
    id { rand(1..100) }
    uid { rand(1..100) }
    image { "https://www.picuki.com/media/2259210751275656034" }
    latitude { 39.750865 }
    longitude { -104.9966132 }
  end
end
