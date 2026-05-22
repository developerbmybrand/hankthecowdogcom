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

ActiveRecord::Schema.define(version: 20140919212404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banners", force: :cascade do |t|
    t.string   "banner_title",      limit: 255
    t.string   "banner_link",       limit: 255
    t.string   "banner_image",      limit: 255
    t.integer  "banner_sortweight"
    t.boolean  "banner_published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "type_blog_category_id"
    t.string   "blog_title",            limit: 255
    t.text     "blog_body"
    t.string   "blog_author",           limit: 255
    t.string   "blog_image",            limit: 255
    t.string   "blog_slug",             limit: 255
    t.string   "blog_tags",             limit: 255
    t.datetime "blog_postdate"
    t.boolean  "blog_published"
    t.boolean  "blog_comments_allowed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogs", ["type_blog_category_id"], name: "index_blogs_on_type_blog_category_id", using: :btree
  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id", using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "book_title",          limit: 255
    t.text     "book_desc"
    t.text     "book_excerpt_title"
    t.text     "book_excerpt_detail"
    t.integer  "book_volume_number"
    t.string   "book_audio",          limit: 255
    t.string   "book_image",          limit: 255
    t.string   "book_link",           limit: 255
    t.boolean  "book_featured"
    t.integer  "book_sortweight"
    t.boolean  "book_published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "book_linkaudible",    limit: 255
    t.string   "book_linkcd",         limit: 255
  end

  create_table "contents", force: :cascade do |t|
    t.integer  "type_content_page_id"
    t.string   "content_title",        limit: 255
    t.text     "content_text"
    t.boolean  "content_published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_image",        limit: 255
    t.string   "content_title_slug",   limit: 255
  end

  add_index "contents", ["type_content_page_id"], name: "index_contents_on_type_content_page_id", using: :btree

  create_table "edu_printouts", force: :cascade do |t|
    t.string   "printout_name",        limit: 255
    t.string   "printout_description", limit: 255
    t.string   "printout_image",       limit: 255
    t.string   "printout_filename",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friends", force: :cascade do |t|
    t.string   "friend_name",        limit: 255
    t.text     "friend_desc"
    t.string   "friend_image",       limit: 255
    t.string   "friend_image_thumb", limit: 255
    t.string   "friend_slug",        limit: 255
    t.integer  "friend_sortweight"
    t.boolean  "friend_published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletters", force: :cascade do |t|
    t.string   "newsletter_name",      limit: 255
    t.datetime "newsletter_date"
    t.string   "newsletter_path",      limit: 255
    t.boolean  "newsletter_published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "printouts", force: :cascade do |t|
    t.string   "printout_name",        limit: 255
    t.string   "printout_description", limit: 255
    t.string   "printout_image",       limit: 255
    t.string   "printout_filename",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "recipe_title",      limit: 255
    t.text     "recipe_desc"
    t.string   "recipe_image",      limit: 255
    t.integer  "recipe_sortweight"
    t.boolean  "recipe_published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "recipe_subtitle",   limit: 255
  end

  create_table "ringtones", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.string   "ringtone_audio", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "screenplays", force: :cascade do |t|
    t.string   "screen_title",      limit: 255
    t.text     "screen_desc"
    t.string   "screen_image",      limit: 255
    t.text     "screen_characters"
    t.text     "screen_story"
    t.text     "screen_songs"
    t.integer  "screen_sortweight"
    t.boolean  "screen_published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "screen_oneact"
  end

  create_table "secforces", force: :cascade do |t|
    t.string   "secforce_username", limit: 255
    t.string   "secforce_password", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.string   "artist",         limit: 255
    t.string   "song_audio",     limit: 255
    t.string   "store_link_url", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_blog_categories", force: :cascade do |t|
    t.string   "type_name",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_blog_tags", force: :cascade do |t|
    t.string   "type_name",     limit: 255
    t.string   "type_location", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_content_pages", force: :cascade do |t|
    t.string   "type_name",     limit: 255
    t.string   "type_location", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_contents", force: :cascade do |t|
    t.string   "type_name",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
