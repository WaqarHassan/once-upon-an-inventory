require 'test_helper'

class DrugsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drug = drugs(:one)
  end

  test "should get index" do
    get drugs_url
    assert_response :success
  end

  test "should get new" do
    get new_drug_url
    assert_response :success
  end

  test "should create drug" do
    assert_difference('Drug.count') do
      post drugs_url, params: { drug: { brand_name: @drug.brand_name, company_id: @drug.company_id, generic_name: @drug.generic_name, purchase_price: @drug.purchase_price, retail_price: @drug.retail_price, total_price: @drug.total_price } }
    end

    assert_redirected_to drug_url(Drug.last)
  end

  test "should show drug" do
    get drug_url(@drug)
    assert_response :success
  end

  test "should get edit" do
    get edit_drug_url(@drug)
    assert_response :success
  end

  test "should update drug" do
    patch drug_url(@drug), params: { drug: { brand_name: @drug.brand_name, company_id: @drug.company_id, generic_name: @drug.generic_name, purchase_price: @drug.purchase_price, retail_price: @drug.retail_price, total_price: @drug.total_price } }
    assert_redirected_to drug_url(@drug)
  end

  test "should destroy drug" do
    assert_difference('Drug.count', -1) do
      delete drug_url(@drug)
    end

    assert_redirected_to drugs_url
  end
end
