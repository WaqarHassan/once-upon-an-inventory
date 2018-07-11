class AddColumnToInvoiceDrugs < ActiveRecord::Migration[5.0]
  def change
    add_column :invoice_drugs, :quantity, :float
    add_column :invoice_drugs, :price, :float
  end
end
