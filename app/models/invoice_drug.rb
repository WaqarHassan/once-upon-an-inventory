class InvoiceDrug < ApplicationRecord
  acts_as_paranoid
  belongs_to :drug
  belongs_to :invoice
  def amount
    quantity * price rescue nil
  end
  def get_profit
    total_amount= quantity * price
    invoice_discount_amount = total_amount * (invoice.discount / 100)
    remaining_amount = total_amount - invoice_discount_amount
    profit_discount  = discount - invoice.discount
    ((remaining_amount) * (profit_discount / 100)).round(2)
  end
end
