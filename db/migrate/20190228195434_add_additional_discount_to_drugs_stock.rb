class AddAdditionalDiscountToDrugsStock < ActiveRecord::Migration[5.0]
  def change
    add_column :drugs_stocks, :additional_discount, :float , default: 0.0
  end
end
