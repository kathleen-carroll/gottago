FactoryBot.define do
  factory :user, class: User do
    name { Faker::TvShows::Simpsons.character  }
    email { Faker::Internet.email }
    created_at {Faker::Date.between(from: 6.days.ago, to: Date.today)}
    password {password = Faker::Internet.password}
    id { 14 }
    uid { 14 }
    image { "https://www.picuki.com/media/2259210751275656034" }
    lat { 39.750865 }
    long { -104.9966132 }
  end 
end 