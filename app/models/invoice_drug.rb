class InvoiceDrug < ApplicationRecord
  belongs_to :drug
  belongs_to :invoice
end
