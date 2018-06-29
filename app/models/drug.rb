class Drug < ApplicationRecord
  belongs_to :company
	has_many :distributor_drugs
	has_many :distributors, through: :distributor_drugs
	validates_presence_of :brand_name , :company_id , :purchase_price , :retail_price, :total_price
end
