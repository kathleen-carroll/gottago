class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :experience
      t.integer :cleanliness
      t.integer :smell

      t.string :content 

      t.boolean :well_stocked?
      t.boolean :purchase_required?
      t.boolean :cool_decor?

      t.references :user, foreign_key: true
      t.references :bathroom, foreign_key: true

      t.timestamps
    end
  end
end
