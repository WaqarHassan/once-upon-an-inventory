class Drug < ApplicationRecord
  belongs_to :company
  	has_many :distributor_drugs
	has_many :distributors, through: :distributor_drugs
end
