require 'rails_helper'

describe Review, type: :model do

  describe "relationships" do
    it {should belong_to :user}
    it {should belong_to :bathroom}
  end

  describe "validations" do
    # it { should validate_presence_of :experience }
    # it { should validate_presence_of :cleanliness }
    # it { should validate_presence_of :smell }
    it { should validate_inclusion_of(:well_stocked?).in_array([true,false]) }
    it { should validate_inclusion_of(:purchase_required?).in_array([true,false]) }
    it { should validate_inclusion_of(:cool_decor?).in_array([true,false]) }
  end

  it ".had_a_disliked_experience" do
    bathroom = create(:bathroom)
    user = create(:user)
    review_1 = create(:review, bathroom_id: bathroom.id, user_id: user.id  )
    binding.pry
    # expect(item_5.active?).to eq(false)

    # merchant_3.activate_items

    # item_5.reload

    # expect(item_5.active?).to eq(true)
  end

end
