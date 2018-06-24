class DistributorDrug < ApplicationRecord
	belongs_to :distributor
	belongs_to :drug
end
