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

ActiveRecord::Schema.define(version: 20151212070426) do

  create_table "ads", force: :cascade do |t|
    t.string   "book"
    t.string   "price"
    t.string   "tags"
    t.string   "title"
    t.string   "description"
    t.string   "user"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "authors"
    t.string   "user"
    t.string   "publishers"
    t.integer  "num_of_pages"
    t.integer  "edition"
    t.boolean  "isHardcover"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "email"
    t.string   "address"
    t.string   "phone"
    t.boolean  "isAdmin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
