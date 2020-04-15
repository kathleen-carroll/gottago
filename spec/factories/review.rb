FactoryBot.define do
  factory :review, class: Review do
    experience { 1 }
    cleanliness { 1 }
    smell { 1 }
    content {Faker::Lorem.sentence}
    
    well_stocked? {:true}
    purchase_required? {:true}
    cool_decor? {:true}

    created_at {Faker::Date.between(from: 6.days.ago, to: Date.today)}
  end
end 