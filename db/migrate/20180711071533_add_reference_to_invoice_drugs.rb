class AddReferenceToInvoiceDrugs < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoice_drugs, :invoice, foreign_key: true
  end
end
