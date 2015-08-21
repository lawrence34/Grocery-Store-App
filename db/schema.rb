# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150820171121) do

  create_table "categories", force: :cascade do |t|
    t.string "category", limit: 255
  end

  create_table "orderlines", force: :cascade do |t|
    t.integer "quantity",   limit: 4, null: false
    t.integer "product_id", limit: 4, null: false
    t.integer "order_id",   limit: 4, null: false
  end

  add_index "orderlines", ["order_id"], name: "index_orderlines_on_order_id", using: :btree
  add_index "orderlines", ["product_id"], name: "index_orderlines_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.string   "description", limit: 255, null: false
    t.integer  "price",       limit: 4,   null: false
    t.string   "thumb",       limit: 255, null: false
    t.integer  "category_id", limit: 4,   null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",      limit: 255
    t.string   "email",         limit: 255
    t.string   "first_name",    limit: 255
    t.string   "last_name",     limit: 255
    t.string   "password",      limit: 255
    t.string   "salt_password", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "orderlines", "orders"
  add_foreign_key "orderlines", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
end
