json.extract! drugs_stock, :id, :retail_price, :total_price, :purchase_price, :drugs_id, :company_id, :created_at, :updated_at
json.url drugs_stock_url(drugs_stock, format: :json)
