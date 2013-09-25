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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130925154106) do

  create_table "dreams", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "privacy",     :default => true
    t.string   "title"
    t.datetime "date"
    t.boolean  "nightmare"
    t.boolean  "lucid"
    t.boolean  "recurring"
    t.boolean  "fragmented"
    t.text     "hashtag"
    t.string   "emotion"
    t.string   "imagesource"
    t.string   "imageowner"
  end

  add_index "dreams", ["user_id", "created_at"], :name => "index_pins_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "password_digest"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "remember_token"
    t.boolean  "admin",                  :default => false
    t.string   "username"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "last_log_in"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
