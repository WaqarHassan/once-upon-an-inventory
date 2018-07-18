class RenameTotalPriceToTradePrice < ActiveRecord::Migration[5.0]
  def change
    rename_column  :drugs_stocks , :total_price , :trade_price
    rename_column  :drugs , :total_price , :trade_price
  end
end
