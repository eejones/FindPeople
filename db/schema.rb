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

ActiveRecord::Schema.define(:version => 20130818054828) do

  create_table "members", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "password_digest"
    t.boolean  "act"
    t.boolean  "produce"
    t.boolean  "direct"
    t.boolean  "camera"
    t.boolean  "extra"
    t.boolean  "pa"
    t.boolean  "write"
    t.boolean  "sound"
    t.boolean  "wardrobe"
    t.boolean  "setdesign"
    t.boolean  "stunt"
    t.boolean  "marketing"
    t.boolean  "other"
    t.string   "what"
    t.boolean  "paid"
    t.integer  "salary"
    t.string   "credits"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "remember_token"
    t.string   "email"
    t.boolean  "admin",               :default => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "profilevid"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "theme"
    t.string   "mytheme",             :default => "Classic"
  end

  add_index "members", ["act"], :name => "index_members_on_act"
  add_index "members", ["camera"], :name => "index_members_on_camera"
  add_index "members", ["direct"], :name => "index_members_on_direct"
  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["extra"], :name => "index_members_on_extra"
  add_index "members", ["marketing"], :name => "index_members_on_marketing"
  add_index "members", ["other"], :name => "index_members_on_other"
  add_index "members", ["pa"], :name => "index_members_on_pa"
  add_index "members", ["paid"], :name => "index_members_on_paid"
  add_index "members", ["produce"], :name => "index_members_on_produce"
  add_index "members", ["remember_token"], :name => "index_members_on_remember_token"
  add_index "members", ["setdesign"], :name => "index_members_on_setdesign"
  add_index "members", ["sound"], :name => "index_members_on_sound"
  add_index "members", ["stunt"], :name => "index_members_on_stunt"
  add_index "members", ["username"], :name => "index_members_on_username", :unique => true
  add_index "members", ["wardrobe"], :name => "index_members_on_wardrobe"
  add_index "members", ["write"], :name => "index_members_on_write"

  create_table "resumevids", :force => true do |t|
    t.string   "rvideo"
    t.string   "originvid"
    t.string   "name"
    t.text     "description"
    t.integer  "member_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "resumevids", ["member_id"], :name => "index_resumevids_on_member_id"

end
