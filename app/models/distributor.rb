class Distributor < ApplicationRecord
	has_many :distributor_drugs
	has_many :drugs, through: :distributor_drugs
end
