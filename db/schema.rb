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

ActiveRecord::Schema.define(version: 2023_08_23_031550) do

  create_table "categories", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_items", charset: "utf8mb3", force: :cascade do |t|
    t.integer "quantity"
    t.integer "price"
    t.bigint "product_id"
    t.bigint "order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", charset: "utf8mb3", force: :cascade do |t|
    t.string "address"
    t.string "phone"
    t.integer "status", default: 0
    t.integer "total_price"
    t.string "reason_description"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.text "description"
    t.integer "sold"
    t.integer "status", default: 0
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "status", default: 0
    t.integer "role", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "remember_token"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
end
