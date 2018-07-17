class AddReferenceToDrugsStock < ActiveRecord::Migration[5.0]
  def change
    add_reference :drugs_stocks, :distributor, foreign_key: true
  end
end
