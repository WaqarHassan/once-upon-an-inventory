# == Schema Information
#
# Table name: invoices
#
#  id           :integer          not null, primary key
#  total        :float
#  patient_name :string
#  age          :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  discount     :float
#  gross        :float
#  invoice_date :date
#  deleted_at   :datetime
#
require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
