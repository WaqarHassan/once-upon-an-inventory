class Distributor < ApplicationRecord
	acts_as_paranoid
	has_many :distributor_drugs
	has_many :drugs, through: :distributor_drugs
end
