class AddQuantityToDrugsStocks < ActiveRecord::Migration[5.0]
  def change
    add_column :drugs_stocks, :quantity, :integer
  end
end
