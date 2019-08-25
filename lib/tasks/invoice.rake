namespace :restore do
  desc 'Import applicant data from CSV to database'
  require 'csv'
  task :drugs_stocks => :environment do
    file = File.join(Rails.root, 'lib', 'tasks', 'drugs_stockss.csv')
    # CSV.foreach('/drugs_stockss.csv', :headers => true) do |row|
    CSV.foreach(file, :headers => true) do |row|
      r = row.to_hash
      DrugsStock.create!(id: r["id"], retail_price: r["retail_price"], trade_price: r["trade_price"],
                         purchase_price: r["purchase_price"], drug_id: r["drug_id"], company_id: r["company_id"],
                         created_at: r["created_at"],
                         updated_at: r["updated_at"], distributor_id: r["distributor_id"],
                         quantity: r["quantity"], invoice_date: r["invoice_date"],
                         invoice_number: r["invoice_number"],
                         deleted_at: r["deleted_at"], discount: r["discount"], additional_discount: r["additional_discount"])
    end
  end
  task :invoice_drugs => :environment do
    file = File.join(Rails.root, 'lib', 'tasks', 'invoice_drugss.csv')
    # CSV.foreach('invoice_drugss.csv', :headers => true) do |row|
    CSV.foreach(file, :headers => true) do |row|
      r = row.to_hash
      InvoiceDrug.create!(
        id: r["id"], drug_name: r["drug_name"], drug_id: r["drug_id"], created_at: r["created_at"], updated_at: r["updated_at"],
        quantity: r["quantity"], price: r["price"], invoice_id: r["invoice_id"], deleted_at: r["deleted_at"], discount: r["discount"])
    end
  end
  task :invoices => :environment do
    file = File.join(Rails.root, 'lib', 'tasks', 'invoicess.csv')
    # CSV.foreach('invoicess.csv', :headers => true) do |row|
    CSV.foreach(file, :headers => true) do |row|
      r = row.to_hash
      Invoice.create!(id: r["id"], total: r["total"], patient_name: r["patient_name"],
                      age: r["age"],
                      created_at: r["created_at"], updated_at: r["updated_at"],
                      discount: r["discount"], gross: r["gross"], invoice_date: r["invoice_date"], deleted_at: r["deleted_at"] )
    end
  end
end

#git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch lib/tasks/drugs_stockss.csv' --prune-empty --tag-name-filter cat -- --all
#  git push origin data_restore -f
# heroku ps
#   507  heroku ps:stop run.6841
# heroku pg:psql
# \copy (SELECT * FROM users) TO dump.csv CSV DELIMITER ','
# \q to exit