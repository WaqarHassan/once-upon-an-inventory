# == Schema Information
#
# Table name: invoice_drugs
#
#  id         :integer          not null, primary key
#  drug_name  :string
#  drug_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :float
#  price      :float
#  invoice_id :integer
#  deleted_at :datetime
#  discount   :float            default(15.0)
#
require 'test_helper'

class InvoiceDrugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
