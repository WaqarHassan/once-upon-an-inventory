class DrugsStock < ApplicationRecord
  belongs_to :drug
  belongs_to  :company
end
