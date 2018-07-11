json.extract! invoice_drug, :id, :drug_name, :drug_id, :created_at, :updated_at
json.url invoice_drug_url(invoice_drug, format: :json)
