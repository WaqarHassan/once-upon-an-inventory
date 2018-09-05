class DistributorDrug < ApplicationRecord
	# acts_as_paranoid
	belongs_to :distributor
	belongs_to :drug
end
