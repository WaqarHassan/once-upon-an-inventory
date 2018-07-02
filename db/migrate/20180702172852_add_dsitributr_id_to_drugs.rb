class AddDsitributrIdToDrugs < ActiveRecord::Migration[5.0]
  def change
    add_reference :drugs, :distributor, foreign_key: true
  end
end
