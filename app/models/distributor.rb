# == Schema Information
#
# Table name: distributors
#
#  id                     :integer          not null, primary key
#  name                   :string
#  contact_person         :string
#  primary_phone_no       :string
#  secondary_phone_number :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  deleted_at             :datetime
#
class Distributor < ApplicationRecord
	acts_as_paranoid
	has_many :distributor_drugs
	has_many :drugs, through: :distributor_drugs
end
