class AddDiscountToInvoice < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :discount, :float
  end
end
