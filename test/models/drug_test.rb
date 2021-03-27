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
require 'test_helper'

class DrugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
