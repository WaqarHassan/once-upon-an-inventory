class AddInvoiceNumberToDrugsStocks < ActiveRecord::Migration[5.0]
  def change
    add_column :drugs_stocks, :invoice_date, :date
    add_column :drugs_stocks, :invoice_number, :string
  end
end
