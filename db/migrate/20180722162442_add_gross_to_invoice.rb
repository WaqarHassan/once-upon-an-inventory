class AddGrossToInvoice < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :gross, :float
  end
end
