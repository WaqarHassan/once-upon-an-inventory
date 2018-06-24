class CreateDrugs < ActiveRecord::Migration[5.0]
  def change
    create_table :drugs do |t|
      t.string :brand_name
      t.string :generic_name
      t.float :retail_price
      t.float :total_price
      t.float :purchase_price
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
