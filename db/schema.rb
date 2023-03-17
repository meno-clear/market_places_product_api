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

ActiveRecord::Schema[7.0].define(version: 2023_03_15_181520) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "address"
    t.string "street"
    t.string "number"
    t.string "district"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "postal_code"
    t.string "type"
    t.float "longitude"
    t.float "latitude"
    t.geometry "coordinates", limit: {:srid=>0, :type=>"st_point"}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.string "product_name"
    t.integer "product_price_in_cents"
    t.integer "quantity"
    t.integer "cart_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "market_place_partner_id", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["market_place_partner_id"], name: "index_cart_items_on_market_place_partner_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "total"
    t.integer "price_in_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "market_place_partners", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "cnpj"
    t.integer "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_market_place_partners_on_user_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity"
    t.integer "price_in_cents"
    t.integer "order_id"
    t.integer "cart_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_item_id"], name: "index_order_items_on_cart_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "total"
    t.integer "price_in_cents"
    t.integer "user_id"
    t.integer "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "market_place_partner_id", null: false
    t.integer "status"
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["market_place_partner_id"], name: "index_orders_on_market_place_partner_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price_in_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "market_place_partner_id", null: false
    t.index ["market_place_partner_id"], name: "index_products_on_market_place_partner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "cart_items", "market_place_partners"
  add_foreign_key "market_place_partners", "users"
  add_foreign_key "orders", "market_place_partners"
  add_foreign_key "products", "market_place_partners"
end
