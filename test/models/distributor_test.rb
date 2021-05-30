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
require 'test_helper'

class DistributorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
