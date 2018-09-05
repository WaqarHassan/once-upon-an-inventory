class AddDeletedAtToDrugsStock < ActiveRecord::Migration[5.0]
  def change
    add_column :drugs_stocks, :deleted_at, :datetime
    add_index :drugs_stocks, :deleted_at
  end
end
