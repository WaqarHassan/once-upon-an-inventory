# == Schema Information
#
# Table name: distributor_drugs
#
#  id             :integer          not null, primary key
#  distributor_id :integer
#  drug_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class DistributorDrug < ApplicationRecord
	# acts_as_paranoid
	belongs_to :distributor
	belongs_to :drug
end
