FactoryBot.define do
  factory :user, class: User do
    name { Faker::TvShows::Simpsons.character  }
    email { Faker::Internet.email }
    created_at {Faker::Date.between(from: 6.days.ago, to: Date.today)}
    password {password = Faker::Internet.password}
  end
end 