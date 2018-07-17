require 'test_helper'

class DrugsStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drugs_stock = drugs_stocks(:one)
  end

  test "should get index" do
    get drugs_stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_drugs_stock_url
    assert_response :success
  end

  test "should create drugs_stock" do
    assert_difference('DrugsStock.count') do
      post drugs_stocks_url, params: { drugs_stock: { company_id: @drugs_stock.company_id, drugs_id: @drugs_stock.drugs_id, purchase_price: @drugs_stock.purchase_price, retail_price: @drugs_stock.retail_price, total_price: @drugs_stock.total_price } }
    end

    assert_redirected_to drugs_stock_url(DrugsStock.last)
  end

  test "should show drugs_stock" do
    get drugs_stock_url(@drugs_stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_drugs_stock_url(@drugs_stock)
    assert_response :success
  end

  test "should update drugs_stock" do
    patch drugs_stock_url(@drugs_stock), params: { drugs_stock: { company_id: @drugs_stock.company_id, drugs_id: @drugs_stock.drugs_id, purchase_price: @drugs_stock.purchase_price, retail_price: @drugs_stock.retail_price, total_price: @drugs_stock.total_price } }
    assert_redirected_to drugs_stock_url(@drugs_stock)
  end

  test "should destroy drugs_stock" do
    assert_difference('DrugsStock.count', -1) do
      delete drugs_stock_url(@drugs_stock)
    end

    assert_redirected_to drugs_stocks_url
  end
end
