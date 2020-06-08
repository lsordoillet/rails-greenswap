class AddStreetToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :street_name, :string
  end
end
