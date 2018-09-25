class Invoice < ApplicationRecord
  acts_as_paranoid
  has_many :invoice_drugs, dependent: :destroy
end
