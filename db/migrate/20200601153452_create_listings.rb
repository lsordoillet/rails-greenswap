class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :plant_category
      t.string :care_level_category
      t.string :listing_type
      t.text :description
      t.boolean :active
      t.integer :quantity, default: 1
      t.string :postcode
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
