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

ActiveRecord::Schema.define(version: 20140227132947) do

  create_table "comments", force: true do |t|
    t.text     "content"
    t.string   "timecode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "movie_id"
  end

  create_table "movies", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.integer  "year"
    t.text     "summary"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notices", force: true do |t|
    t.string   "title"
    t.text     "short_content"
    t.text     "content"
    t.string   "timecode"
    t.string   "type"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "movid_id"
    t.integer  "movie_id"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
