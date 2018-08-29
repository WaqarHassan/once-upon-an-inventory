class Drug < ApplicationRecord
  belongs_to :company
	has_many :distributor_drugs
	has_many :distributors, through: :distributor_drugs
	has_one :drugs_stock #, class_name: "DrugsStock"
	validates_presence_of :brand_name , :company_id
end
