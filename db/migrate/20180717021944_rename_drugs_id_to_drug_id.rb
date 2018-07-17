class RenameDrugsIdToDrugId < ActiveRecord::Migration[5.0]
  def change
    rename_column  :drugs_stocks , :drugs_id , :drug_id
  end
end
