class DrugsStock < ApplicationRecord
  acts_as_paranoid
  belongs_to :drug
  belongs_to :company
end
