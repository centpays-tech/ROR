# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_23_094256) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acquirers", force: :cascade do |t|
    t.string "acquirer_name"
    t.string "acquirer_email"
    t.string "website_url"
    t.string "city"
    t.string "status", default: "Active", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banks", force: :cascade do |t|
    t.string "bank_name"
    t.string "div_id"
    t.string "bank_url"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_subcategories", force: :cascade do |t|
    t.string "subcategory_name"
    t.string "status", default: "Active"
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "businesstypes", force: :cascade do |t|
    t.string "businesstype_name"
    t.string "status", default: "Active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name", null: false
    t.string "short_name"
    t.string "status", default: "Active", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_name"], name: "index_categories_on_category_name", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "company_name"
    t.string "username"
    t.string "email"
    t.integer "phone_number"
    t.integer "postal_code"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "street_address"
    t.string "street_address2"
    t.string "industries_id"
    t.string "director_first_name"
    t.string "director_last_name"
    t.string "skype_id"
    t.string "business_type"
    t.string "business_category"
    t.string "business_subcategory"
    t.string "business_registered_on"
    t.string "merchant_pay_in"
    t.string "merchant_pay_out"
    t.decimal "settlement_charge"
    t.string "turnover"
    t.decimal "expected_chargeback_percentage"
    t.string "website_url"
    t.string "merchant_id"
    t.string "status"
    t.string "last_settled_date"
    t.string "currency"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "createcurrencies", force: :cascade do |t|
    t.string "currency_name"
    t.string "currency_code"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documentcategories", force: :cascade do |t|
    t.string "document_name"
    t.string "document_type"
    t.string "side"
    t.integer "document_number"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documenttypes", force: :cascade do |t|
    t.string "document_type"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "live_transaction_tables", force: :cascade do |t|
    t.integer "livedata_id"
    t.string "txnid"
    t.string "merchantTxnId"
    t.string "merchant"
    t.float "amount"
    t.float "fee"
    t.float "merchant_fee"
    t.string "backUrl"
    t.string "merchant_id"
    t.string "transactiondate"
    t.string "statusBKP"
    t.string "Status"
    t.integer "isSettled"
    t.string "settledDate"
    t.string "settledTxnId"
    t.float "settledAmount"
    t.integer "router"
    t.string "description"
    t.string "email"
    t.string "currency"
    t.string "env"
    t.string "mode"
    t.string "paymentgateway"
    t.string "payment_id"
    t.string "pg_order_key"
    t.string "message"
    t.string "webhook_id"
    t.string "requested_phone"
    t.string "orderNo"
    t.string "cname"
    t.string "tempUpdated"
    t.string "is_admin_settled"
    t.string "admin_settled_date"
    t.float "admin_settled_amount"
    t.string "cardtype"
    t.string "requestMode"
    t.string "cardnumber"
    t.string "cardExpire"
    t.string "cardCVC"
    t.string "pdate"
    t.string "country"
    t.string "dels"
    t.string "web_url"
    t.string "mid"
    t.integer "from_temp"
    t.string "accountHolder"
    t.string "accountBankCode"
    t.string "accountNumber"
    t.string "birthDate"
    t.string "internal_callback"
    t.string "internal_callback_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["livedata_id"], name: "index_live_transaction_tables_on_livedata_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "mobile_no"
    t.string "country"
    t.string "role"
    t.string "password_digest"
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
