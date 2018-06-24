json.extract! drug, :id, :brand_name, :generic_name, :retail_price, :total_price, :purchase_price, :company_id, :created_at, :updated_at
json.url drug_url(drug, format: :json)
