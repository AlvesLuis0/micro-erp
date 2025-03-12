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

ActiveRecord::Schema[8.0].define(version: 2025_03_12_111249) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "entry_exit", ["entry", "exit"]
  create_enum "operation_types", ["purchase", "sale", "consignment", "exchange", "transfer", "other"]
  create_enum "payment_types", ["cash", "credit_card", "debit_card", "bank_transfer", "installment", "eletronic_wallet", "other"]
  create_enum "statuses", ["active", "inactive", "deleted"]

  create_table "cities", force: :cascade do |t|
    t.string "description", limit: 60, null: false
    t.bigint "state_id", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "operation_codes", force: :cascade do |t|
    t.string "description", limit: 60, null: false
    t.enum "operation_type", null: false, enum_type: "operation_types"
    t.enum "entry_exit", null: false, enum_type: "entry_exit"
    t.boolean "updates_stock", null: false
    t.boolean "input_quantity_on_create", null: false
    t.boolean "input_quantity_on_update", null: false
    t.boolean "input_price_on_create", null: false
    t.boolean "input_price_on_update", null: false
    t.enum "status", default: "active", null: false, enum_type: "statuses"
    t.index ["entry_exit"], name: "index_operation_codes_on_entry_exit"
    t.index ["operation_type"], name: "index_operation_codes_on_operation_type"
    t.index ["status"], name: "index_operation_codes_on_status"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "description", limit: 60, null: false
    t.enum "payment_type", null: false, enum_type: "payment_types"
    t.enum "status", default: "active", null: false, enum_type: "statuses"
    t.index ["payment_type"], name: "index_payment_methods_on_payment_type"
    t.index ["status"], name: "index_payment_methods_on_status"
  end

  create_table "sale_methods", force: :cascade do |t|
    t.string "description", limit: 60, null: false
    t.integer "order"
    t.enum "status", default: "active", null: false, enum_type: "statuses"
    t.index ["status"], name: "index_sale_methods_on_status"
  end

  create_table "states", force: :cascade do |t|
    t.string "description", limit: 60, null: false
    t.string "uf", limit: 2, null: false
  end

  add_foreign_key "cities", "states"
end
