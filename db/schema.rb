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

ActiveRecord::Schema.define(version: 20180327205618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "posting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["posting_id"], name: "index_comments_on_posting_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "shortcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postings", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "views", default: 0
    t.string "type"
    t.bigint "language_id"
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_postings_on_category_id"
    t.index ["language_id"], name: "index_postings_on_language_id"
    t.index ["user_id"], name: "index_postings_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "language_id"
    t.string "link"
    t.string "level"
    t.string "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_rooms_on_language_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "user_known_languages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "known_languages_id"
    t.integer "write"
    t.integer "speak"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["known_languages_id"], name: "index_user_known_languages_on_known_languages_id"
    t.index ["user_id"], name: "index_user_known_languages_on_user_id"
  end

  create_table "user_languages_studieds", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "languages_studied_id"
    t.integer "write"
    t.integer "speak"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["languages_studied_id"], name: "index_user_languages_studieds_on_languages_studied_id"
    t.index ["user_id"], name: "index_user_languages_studieds_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", default: ""
    t.string "last_name"
    t.integer "gender"
    t.string "avatar", default: ""
    t.string "age"
    t.date "born_on"
    t.string "bio"
    t.string "country", default: ""
    t.integer "created_rooms", default: 0
    t.string "phone", default: ""
    t.integer "created_articles", default: 0
    t.integer "created_debates", default: 0
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "comments", "postings"
  add_foreign_key "comments", "users"
  add_foreign_key "postings", "categories"
  add_foreign_key "postings", "languages"
  add_foreign_key "postings", "users"
  add_foreign_key "rooms", "languages"
  add_foreign_key "rooms", "users"
  add_foreign_key "user_known_languages", "languages", column: "known_languages_id"
  add_foreign_key "user_known_languages", "users"
  add_foreign_key "user_languages_studieds", "languages", column: "languages_studied_id"
  add_foreign_key "user_languages_studieds", "users"
end
