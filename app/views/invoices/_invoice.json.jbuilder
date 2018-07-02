json.extract! invoice, :id, :total, :patient_name, :age, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
