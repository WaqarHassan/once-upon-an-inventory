class AddDiscountToDrugs < ActiveRecord::Migration[5.0]
  def change
    add_column :drugs, :discount, :float , default: 15.0
    add_column :drugs_stocks, :discount, :float , default: 15.0
    add_column :invoice_drugs, :discount, :float , default: 15.0
  end
end
