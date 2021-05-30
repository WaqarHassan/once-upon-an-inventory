# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
class Company < ApplicationRecord
  acts_as_paranoid
  has_many :drugs_stocks

end
