class AddDeletedAtToDrug < ActiveRecord::Migration[5.0]
  def change
    add_column :drugs, :deleted_at, :datetime
    add_index :drugs, :deleted_at
  end
end
