class CreateDistributorDrugs < ActiveRecord::Migration[5.0]
  def change
    create_table :distributor_drugs do |t|
      t.integer :distributor_id
      t.integer :drug_id

      t.timestamps
    end
  end
end
