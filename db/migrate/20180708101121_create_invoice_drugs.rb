class CreateInvoiceDrugs < ActiveRecord::Migration[5.0]
  def change
    create_table :invoice_drugs do |t|
      t.string :drug_name
      t.references :drug, foreign_key: true

      t.timestamps
    end
  end
end
