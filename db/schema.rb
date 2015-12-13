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

ActiveRecord::Schema.define(version: 20151213175358) do

  create_table "ads", force: :cascade do |t|
    t.string   "price"
    t.string   "title"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "ads", ["title"], name: "index_ads_on_title", unique: true
  add_index "ads", ["user_id"], name: "index_ads_on_user_id"

  create_table "authors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "authors", ["book_id"], name: "index_authors_on_book_id"
  add_index "authors", ["last_name"], name: "index_authors_on_last_name", unique: true

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.integer  "num_of_pages"
    t.integer  "edition"
    t.boolean  "isHardcover"
    t.integer  "ad_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "books", ["ad_id"], name: "index_books_on_ad_id"
  add_index "books", ["title"], name: "index_books_on_title", unique: true

  create_table "images", force: :cascade do |t|
    t.integer  "ad_id"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["ad_id"], name: "index_images_on_ad_id"

  create_table "publishers", force: :cascade do |t|
    t.string   "name"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "publishers", ["book_id"], name: "index_publishers_on_book_id"
  add_index "publishers", ["name"], name: "index_publishers_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "address"
    t.string   "phone"
    t.boolean  "isAdmin"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
