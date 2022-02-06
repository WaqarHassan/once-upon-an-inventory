class AddIsReturnToDrugsStocks < ActiveRecord::Migration[5.0]
  def change
    add_column :drugs_stocks, :is_return, :boolean, default: :false
  end
end
