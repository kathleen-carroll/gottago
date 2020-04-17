class AddRefugeIdToBathroom < ActiveRecord::Migration[5.1]
  def change
    add_column :bathrooms, :refuge_id, :string
  end
end
