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

ActiveRecord::Schema.define(version: 20150119140948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: true do |t|
    t.string "first_name"
    t.string "last_name"
    t.text   "biography"
  end

  create_table "book_and_author_links", force: true do |t|
    t.integer "book_id"
    t.integer "author_id"
    t.string  "role"
  end

  create_table "books", force: true do |t|
    t.integer  "publisher_id"
    t.string   "name"
    t.string   "genre"
    t.integer  "page_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "interest_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interests", force: true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.text     "review"
    t.datetime "start_reading"
    t.datetime "finish_reading"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interests", ["user_id", "created_at"], name: "index_interests_on_user_id_and_created_at", using: :btree

  create_table "publishers", force: true do |t|
    t.string "name"
    t.text   "location"
  end

  add_index "publishers", ["name"], name: "index_publishers_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "date_of_birth"
    t.string   "phone"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
