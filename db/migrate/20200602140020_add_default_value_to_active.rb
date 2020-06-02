class AddDefaultValueToActive < ActiveRecord::Migration[6.0]
  def change
    change_column_default :listings, :active, true
  end
end
