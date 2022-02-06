# == Schema Information
#
# Table name: drugs
#
#  id             :integer          not null, primary key
#  brand_name     :string
#  generic_name   :string
#  retail_price   :float
#  trade_price    :float
#  purchase_price :float
#  company_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  distributor_id :integer
#  quantity       :integer          default(0)
#  deleted_at     :datetime
#  discount       :float            default(15.0)
#
class Drug < ApplicationRecord
	acts_as_paranoid
  	belongs_to :company
	has_many :distributor_drugs
	has_many :distributors, through: :distributor_drugs
	has_one :drugs_stock #, class_name: "DrugsStock"
	validates_presence_of :brand_name , :company_id

	def self.normalize_stock
		Drug.all.each do |drug|
			total_purchase_quantity = DrugsStock.where(drug_id: drug.id).sum(:quantity).to_i
			total_sold_quantity = InvoiceDrug.where(drug_id: drug.id).sum(:quantity).to_i
			expected_drug_quantity = total_purchase_quantity - total_sold_quantity
			ids = []
			if drug.quantity != expected_drug_quantity
				ids <<  drug.id
				# drug.update(quantity: expected_drug_quantity)
			end
		end
		puts ids
	end

	def normalize
		total_purchase_quantity = DrugsStock.where(drug_id: self.id).sum(:quantity).to_i
		total_sold_quantity = InvoiceDrug.where(drug_id: self.id).sum(:quantity).to_i
		expected_drug_quantity = total_purchase_quantity - total_sold_quantity
		if self.quantity != expected_drug_quantity
			update(quantity: expected_drug_quantity)
		end
		puts self.id
	end

end
