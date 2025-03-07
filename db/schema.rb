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

ActiveRecord::Schema.define(version: 2020_11_23_162010) do

  create_table "order_entries", force: :cascade do |t|
    t.integer "quantity", default: 0, null: false
    t.integer "unitprice", default: 0, null: false
    t.integer "totalprice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id", null: false
    t.integer "order_id", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "totalCost", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.integer "user_id", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.integer "stockCount", default: 0, null: false
    t.integer "pricePence", default: 0, null: false
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "section_id"
    t.index ["section_id"], name: "index_products_on_section_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content", null: false
    t.integer "rating", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id", null: false
    t.integer "user_id", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "firstName", null: false
    t.string "lastName", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
  end

end
