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
require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
