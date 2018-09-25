class Invoice < ApplicationRecord
  acts_as_paranoid
  has_many :invoice_drugs, dependent: :destroy
  def get_net_discount

  end
end
