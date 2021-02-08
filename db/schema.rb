# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190228195434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_companies_on_deleted_at", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "distributor_drugs", force: :cascade do |t|
    t.integer  "distributor_id"
    t.integer  "drug_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "distributors", force: :cascade do |t|
    t.string   "name"
    t.string   "contact_person"
    t.string   "primary_phone_no"
    t.string   "secondary_phone_number"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_distributors_on_deleted_at", using: :btree
  end

  create_table "drugs", force: :cascade do |t|
    t.string   "brand_name"
    t.string   "generic_name"
    t.float    "retail_price"
    t.float    "trade_price"
    t.float    "purchase_price"
    t.integer  "company_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "distributor_id"
    t.integer  "quantity",       default: 0
    t.datetime "deleted_at"
    t.float    "discount",       default: 15.0
    t.index ["company_id"], name: "index_drugs_on_company_id", using: :btree
    t.index ["deleted_at"], name: "index_drugs_on_deleted_at", using: :btree
    t.index ["distributor_id"], name: "index_drugs_on_distributor_id", using: :btree
  end

  create_table "drugs_stocks", force: :cascade do |t|
    t.float    "retail_price"
    t.float    "trade_price"
    t.float    "purchase_price"
    t.integer  "drug_id"
    t.integer  "company_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "distributor_id"
    t.integer  "quantity"
    t.date     "invoice_date"
    t.string   "invoice_number"
    t.datetime "deleted_at"
    t.float    "discount",            default: 15.0
    t.float    "additional_discount", default: 0.0
    t.index ["deleted_at"], name: "index_drugs_stocks_on_deleted_at", using: :btree
    t.index ["distributor_id"], name: "index_drugs_stocks_on_distributor_id", using: :btree
    t.index ["drug_id"], name: "index_drugs_stocks_on_drug_id", using: :btree
  end

  create_table "invoice_drugs", force: :cascade do |t|
    t.string   "drug_name"
    t.integer  "drug_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.float    "quantity"
    t.float    "price"
    t.integer  "invoice_id"
    t.datetime "deleted_at"
    t.float    "discount",   default: 15.0
    t.index ["deleted_at"], name: "index_invoice_drugs_on_deleted_at", using: :btree
    t.index ["drug_id"], name: "index_invoice_drugs_on_drug_id", using: :btree
    t.index ["invoice_id"], name: "index_invoice_drugs_on_invoice_id", using: :btree
  end

  create_table "invoices", force: :cascade do |t|
    t.float    "total"
    t.string   "patient_name"
    t.float    "age"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "discount"
    t.float    "gross"
    t.date     "invoice_date"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_invoices_on_deleted_at", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "drugs", "companies"
  add_foreign_key "drugs", "distributors"
  add_foreign_key "drugs_stocks", "distributors"
  add_foreign_key "drugs_stocks", "drugs"
  add_foreign_key "invoice_drugs", "drugs"
  add_foreign_key "invoice_drugs", "invoices"
end
