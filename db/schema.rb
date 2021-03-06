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

ActiveRecord::Schema.define(version: 20140422124152) do

  create_table "chapters_users", id: false, force: true do |t|
    t.integer "chapter_id", null: false
    t.integer "user_id",    null: false
  end

  create_table "comments", force: true do |t|
    t.text     "content"
    t.string   "timecode"
    t.datetime "created_at"
    t.integer  "user_id"
    t.datetime "updated_at"
    t.integer  "movie_id"
  end

  create_table "friendships", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  add_index "friendships", ["friend_id", "user_id"], name: "index_friendships_on_friend_id_and_user_id", unique: true
  add_index "friendships", ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true

  create_table "movie_chapters", force: true do |t|
    t.integer  "number"
    t.string   "title"
    t.text     "summary"
    t.string   "timecode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "movie_id"
  end

  create_table "movie_related_facts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movie_related_facts_movies", id: false, force: true do |t|
    t.integer "movie_id",              null: false
    t.integer "movie_related_fact_id", null: false
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

  create_table "movies_related_movies", id: false, force: true do |t|
    t.integer "movie_id",         null: false
    t.integer "related_movie_id", null: false
  end

  add_index "movies_related_movies", ["movie_id", "related_movie_id"], name: "index_movies_related_movies_on_movie_id_and_related_movie_id"
  add_index "movies_related_movies", ["related_movie_id", "movie_id"], name: "index_movies_related_movies_on_related_movie_id_and_movie_id"

  create_table "movies_tags", id: false, force: true do |t|
    t.integer "tag_id",   null: false
    t.integer "movie_id", null: false
  end

  add_index "movies_tags", ["movie_id", "tag_id"], name: "index_movies_tags_on_movie_id_and_tag_id"
  add_index "movies_tags", ["tag_id", "movie_id"], name: "index_movies_tags_on_tag_id_and_movie_id"

  create_table "movies_users", id: false, force: true do |t|
    t.integer "movie_id", null: false
    t.integer "user_id",  null: false
  end

  add_index "movies_users", ["movie_id", "user_id"], name: "index_movies_users_on_movie_id_and_user_id"
  add_index "movies_users", ["user_id", "movie_id"], name: "index_movies_users_on_user_id_and_movie_id"

  create_table "notice_categories", force: true do |t|
    t.string   "title"
    t.string   "nicename"
    t.integer  "parent_id"
    t.string   "color"
    t.string   "background_color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notice_categories_notice_categories", id: false, force: true do |t|
    t.integer "notice_category_id", null: false
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
    t.integer  "movie_id"
    t.integer  "notice_category_id"
    t.text     "teasing"
    t.string   "end_timecode"
  end

  create_table "notices_tags", id: false, force: true do |t|
    t.integer "tag_id",    null: false
    t.integer "notice_id", null: false
  end

  add_index "notices_tags", ["notice_id", "tag_id"], name: "index_notices_tags_on_notice_id_and_tag_id"
  add_index "notices_tags", ["tag_id", "notice_id"], name: "index_notices_tags_on_tag_id_and_notice_id"

  create_table "notices_users", id: false, force: true do |t|
    t.integer "notice_id", null: false
    t.integer "user_id",   null: false
  end

  add_index "notices_users", ["notice_id", "user_id"], name: "index_notices_users_on_notice_id_and_user_id"
  add_index "notices_users", ["user_id", "notice_id"], name: "index_notices_users_on_user_id_and_notice_id"

  create_table "related_movies", force: true do |t|
    t.string   "title"
    t.string   "image"
    t.text     "summary"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
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
