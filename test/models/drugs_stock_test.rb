# == Schema Information
#
# Table name: drugs_stocks
#
#  id                  :integer          not null, primary key
#  retail_price        :float
#  trade_price         :float
#  purchase_price      :float
#  drug_id             :integer
#  company_id          :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  distributor_id      :integer
#  quantity            :integer
#  invoice_date        :date
#  invoice_number      :string
#  deleted_at          :datetime
#  discount            :float            default(15.0)
#  additional_discount :float            default(0.0)
#
require 'test_helper'

class DrugsStockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
