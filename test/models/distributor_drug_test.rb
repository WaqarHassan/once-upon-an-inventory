# == Schema Information
#
# Table name: distributor_drugs
#
#  id             :integer          not null, primary key
#  distributor_id :integer
#  drug_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'test_helper'

class DistributorDrugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
