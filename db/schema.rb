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

ActiveRecord::Schema.define(version: 2021_07_01_025653) do

  create_table "attachments", force: :cascade do |t|
    t.integer "post_id"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_attachments_on_post_id"
  end

  create_table "boat_attachments", force: :cascade do |t|
    t.integer "boat_id"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["boat_id"], name: "index_boat_attachments_on_boat_id"
  end

  create_table "boat_options", force: :cascade do |t|
    t.integer "boat_id"
    t.string "option"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["boat_id"], name: "index_boat_options_on_boat_id"
  end

  create_table "boats", force: :cascade do |t|
    t.string "name", limit: 140
    t.string "image"
    t.text "body"
    t.string "slug"
    t.boolean "rent", default: true
    t.boolean "sell", default: false
    t.decimal "price", precision: 8, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_boats_on_name"
    t.index ["slug"], name: "index_boats_on_slug"
  end

  create_table "house_attachments", force: :cascade do |t|
    t.integer "house_id"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["house_id"], name: "index_house_attachments_on_house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name", limit: 140
    t.string "image"
    t.text "body"
    t.string "slug"
    t.boolean "rent", default: true
    t.boolean "sell", default: false
    t.boolean "land", default: false
    t.decimal "price", precision: 8, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_houses_on_name"
    t.index ["slug"], name: "index_houses_on_slug"
  end

  create_table "posts", force: :cascade do |t|
    t.string "titulo"
    t.text "description"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_posts_on_slug"
  end

  add_foreign_key "boat_attachments", "boats"
  add_foreign_key "boat_options", "boats"
  add_foreign_key "house_attachments", "houses"
end
