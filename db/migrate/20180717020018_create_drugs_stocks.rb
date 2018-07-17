class CreateDrugsStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :drugs_stocks do |t|
      t.float :retail_price
      t.float :total_price
      t.float :purchase_price
      t.references :drugs, foreign_key: true
      t.integer :company_id

      t.timestamps
    end
  end
end
