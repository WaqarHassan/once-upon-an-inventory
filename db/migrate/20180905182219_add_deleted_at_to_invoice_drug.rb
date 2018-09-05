class AddDeletedAtToInvoiceDrug < ActiveRecord::Migration[5.0]
  def change
    add_column :invoice_drugs, :deleted_at, :datetime
    add_index :invoice_drugs, :deleted_at
  end
end
