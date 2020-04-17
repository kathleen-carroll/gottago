FactoryBot.define do
  factory :review, class: Review do
    experience { 2 }
    cleanliness { 2 }
    smell { 2 }
    content {Faker::Lorem.sentence}
    
    well_stocked? {:true}
    purchase_required? {:true}
    cool_decor? {:true}

    created_at {Faker::Date.between(from: 6.days.ago, to: Date.today)}
  end
end 