class AddQuantityToDrugs < ActiveRecord::Migration[5.0]
  def change
    add_column :drugs, :quantity, :integer, default: 0
  end
end
