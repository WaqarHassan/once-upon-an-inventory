require 'test_helper'

class InvoiceDrugsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice_drug = invoice_drugs(:one)
  end

  test "should get index" do
    get invoice_drugs_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_drug_url
    assert_response :success
  end

  test "should create invoice_drug" do
    assert_difference('InvoiceDrug.count') do
      post invoice_drugs_url, params: { invoice_drug: { drug_id: @invoice_drug.drug_id, drug_name: @invoice_drug.drug_name } }
    end

    assert_redirected_to invoice_drug_url(InvoiceDrug.last)
  end

  test "should show invoice_drug" do
    get invoice_drug_url(@invoice_drug)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_drug_url(@invoice_drug)
    assert_response :success
  end

  test "should update invoice_drug" do
    patch invoice_drug_url(@invoice_drug), params: { invoice_drug: { drug_id: @invoice_drug.drug_id, drug_name: @invoice_drug.drug_name } }
    assert_redirected_to invoice_drug_url(@invoice_drug)
  end

  test "should destroy invoice_drug" do
    assert_difference('InvoiceDrug.count', -1) do
      delete invoice_drug_url(@invoice_drug)
    end

    assert_redirected_to invoice_drugs_url
  end
end
