class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.float :total
      t.string :patient_name
      t.float :age

      t.timestamps
    end
  end
end
