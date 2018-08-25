class AddInvoiceDateToInvoice < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :invoice_date, :date
  end
end
