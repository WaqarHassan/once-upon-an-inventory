class Drug < ApplicationRecord
  belongs_to :company
	has_many :distributor_drugs
	has_many :distributors, through: :distributor_drugs
	has_one :drugs_stocks #, class_name: "DrugsStock"
	validates_presence_of :brand_name , :company_id , :purchase_price , :retail_price, :trade_price
end
