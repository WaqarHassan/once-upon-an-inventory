class InvoiceDrug < ApplicationRecord
  acts_as_paranoid
  belongs_to :drug
  belongs_to :invoice
  def amount
    quantity * price rescue nil
  end
end
