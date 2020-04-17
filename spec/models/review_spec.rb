require 'rails_helper'

describe Review, type: :model do

  describe "relationships" do
    it {should belong_to :user}
    it {should belong_to :bathroom}
  end

  describe "validations" do
    it { should validate_inclusion_of(:well_stocked?).in_array([true,false]) }
    it { should validate_inclusion_of(:purchase_required?).in_array([true,false]) }
    it { should validate_inclusion_of(:cool_decor?).in_array([true,false]) }
  end

  it ".had_a_disliked_experience" do
    bathroom = create(:bathroom, latitude: 39.741692, longitude: -104.985210)
    user = create(:user)
    review_1 = create(:review, bathroom_id: bathroom.id, user_id: user.id  )
    review_2 = create(:review, bathroom_id: bathroom.id, user_id: user.id  )

    assert_equal "liked", review_1.experience
    assert_equal "liked", review_1.cleanliness
    assert_equal "liked", review_1.smell

    expect(review_1.well_stocked?).to eq(true)
    expect(review_1.purchase_required?).to eq(true)
    expect(review_1.cool_decor?).to eq(true)


    review_1.update(experience: 1)
    review_1.update(cleanliness: 1)
    review_1.update(smell: 1)

    review_1.update(well_stocked?: false)
    review_1.update(purchase_required?: false)
    review_1.update(cool_decor?: false)


    assert_equal "disliked", review_1.experience
    assert_equal "disliked", review_1.cleanliness
    assert_equal "disliked", review_1.smell

    expect(review_1.well_stocked?).to eq(false)
    expect(review_1.purchase_required?).to eq(false)
    expect(review_1.cool_decor?).to eq(false)

  end

  it ".had_a_lovley_experience" do
    bathroom = create(:bathroom, latitude: 39.741692, longitude: -104.985210)
    user = create(:user)
    review_1 = create(:review, bathroom_id: bathroom.id, user_id: user.id  )
    review_2 = create(:review, bathroom_id: bathroom.id, user_id: user.id  )

    assert_equal "liked", review_1.experience
    assert_equal "liked", review_1.cleanliness
    assert_equal "liked", review_1.smell

    expect(review_1.well_stocked?).to eq(true)
    expect(review_1.purchase_required?).to eq(true)
    expect(review_1.cool_decor?).to eq(true)


    review_1.update(experience: 3)
    review_1.update(cleanliness: 3)
    review_1.update(smell: 3)

    assert_equal "loved", review_1.experience
    assert_equal "loved", review_1.cleanliness
    assert_equal "loved", review_1.smell

  end
end
