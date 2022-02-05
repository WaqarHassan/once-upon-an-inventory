# == Schema Information
#
# Table name: invoice_drugs
#
#  id         :integer          not null, primary key
#  drug_name  :string
#  drug_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :float
#  price      :float
#  invoice_id :integer
#  deleted_at :datetime
#  discount   :float            default(15.0)
#
class InvoiceDrug < ApplicationRecord
  acts_as_paranoid
  belongs_to :drug
  belongs_to :invoice

  def amount
    quantity * price rescue nil
  end

  def get_profit
    total_amount= quantity * price #100
    invoice_discount_amount = total_amount * (invoice.discount / 100)
    remaining_amount = total_amount - invoice_discount_amount
    #
    profit_discount  = discount - invoice.discount
    ((total_amount) * (profit_discount  / 100)).round(2)
  end
  
end
