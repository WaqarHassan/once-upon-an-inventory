class InvoiceDrug < ApplicationRecord
  belongs_to :drug
  belongs_to :invoice
  def amount
    quantity * price rescue nil
  end
end
