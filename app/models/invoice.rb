class Invoice < ApplicationRecord

  acts_as_paranoid

  has_many :invoice_drugs, dependent: :destroy

  def get_profit
    invoice_drugs.map{|id| (id.get_profit rescue 0.0)}.sum rescue "error"
  end

  def get_discount
    invoice_drugs.map{|id| id.discount - discount}.sum rescue "error"
  end

  def drugs
    self.invoice_drugs
  end
end


# def get_profit
#   invoice_drugs.map{|id| (id.quantity * id.price) * ((id.discount - discount )/ 100)}.sum rescue "error"
#   profit =     0
#   invoice_drugs.each do |id|
#     #total_amount = id.quantity * id.price
#     #invoice_discount_amount= total_amount * ( discount / 100 )  # 5% invoice_discount
#     #remaining_amount = total_amount- invoice_discount_amount
#     #profit_discount = id.discount - discount
#     profit = profit +  id.get_profit
#   end
#   return profit
# end