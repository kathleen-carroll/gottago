class CreateBathroom < ActiveRecord::Migration[5.1]
  def change
    create_table :bathrooms do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.float :latitude
      t.float :longitude
      t.boolean :accessible
      t.boolean :unisex
      t.boolean :changing_table
      

      t.timestamps
    end
  end
end
