class CreateDistributors < ActiveRecord::Migration[5.0]
  def change
    create_table :distributors do |t|
      t.string :name
      t.string :contact_person
      t.string :primary_phone_no
      t.string :secondary_phone_number

      t.timestamps
    end
  end
end
