# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_13_001234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "item_designs", force: :cascade do |t|
    t.string "name"
    t.integer "refund_price_cents", default: 0, null: false
    t.string "refund_price_currency", default: "USD", null: false
    t.string "item_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "secured_items", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_design_id", null: false
    t.bigint "subscription_id", null: false
    t.date "activation_date"
    t.date "expiration_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_design_id"], name: "index_secured_items_on_item_design_id"
    t.index ["subscription_id"], name: "index_secured_items_on_subscription_id"
    t.index ["user_id"], name: "index_secured_items_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "item_design_id", null: false
    t.string "subscription_type"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.integer "days"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_design_id"], name: "index_subscriptions_on_item_design_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "adress"
    t.string "phone_number"
    t.date "birth_date"
    t.string "cpf"
    t.integer "card_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "secured_items", "item_designs"
  add_foreign_key "secured_items", "subscriptions"
  add_foreign_key "secured_items", "users"
  add_foreign_key "subscriptions", "item_designs"
end
