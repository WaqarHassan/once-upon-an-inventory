class Company < ApplicationRecord
  acts_as_paranoid
  has_many :drugs_stocks

end
