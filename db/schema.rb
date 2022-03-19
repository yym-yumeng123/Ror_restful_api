# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_19_113846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ads", force: :cascade do |t|
    t.string "title"
    t.string "banner"
    t.string "uri"
    t.integer "order"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_ads_on_user_id"
  end

  create_table "collections", force: :cascade do |t|
    t.bigint "sheet_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sheet_id", "user_id"], name: "index_collections_on_sheet_id_and_user_id", unique: true
    t.index ["sheet_id"], name: "index_collections_on_sheet_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "relations", force: :cascade do |t|
    t.bigint "song_id", null: false
    t.bigint "sheet_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sheet_id"], name: "index_relations_on_sheet_id"
    t.index ["song_id", "sheet_id", "user_id"], name: "index_relations_on_song_id_and_sheet_id_and_user_id", unique: true
    t.index ["song_id"], name: "index_relations_on_song_id"
    t.index ["user_id"], name: "index_relations_on_user_id"
  end

  create_table "sheets", force: :cascade do |t|
    t.string "title", null: false
    t.string "banner"
    t.string "description"
    t.bigint "clicks_count"
    t.integer "collections_count"
    t.integer "comments_count"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_sheets_on_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title", null: false
    t.string "banner", null: false
    t.string "uri", null: false
    t.integer "clicks_count", default: 0, null: false
    t.integer "comments_count", default: 0, null: false
    t.integer "style"
    t.text "lyric"
    t.bigint "user_id", null: false
    t.integer "singer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "tag_sheets", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "sheet_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sheet_id"], name: "index_tag_sheets_on_sheet_id"
    t.index ["tag_id"], name: "index_tag_sheets_on_tag_id"
    t.index ["user_id", "tag_id", "sheet_id"], name: "index_tag_sheets_on_user_id_and_tag_id_and_sheet_id", unique: true
    t.index ["user_id"], name: "index_tag_sheets_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "parent_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_tags_on_parent_id"
    t.index ["title", "user_id"], name: "index_tags_on_title_and_user_id", unique: true
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "avatar"
    t.string "description"
    t.integer "gender", default: 0, null: false
    t.date "birthday"
    t.string "email", null: false
    t.string "phone", null: false
    t.string "password_digest", null: false
    t.string "session_digest"
    t.string "reset_password_digest"
    t.datetime "reset_password_sent_at"
    t.string "confirmation_digest"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "qq_id"
    t.string "qq_id_digest"
    t.string "wechat_id"
    t.string "wechat_id_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["qq_id"], name: "index_users_on_qq_id", unique: true
    t.index ["wechat_id"], name: "index_users_on_wechat_id", unique: true
  end

  add_foreign_key "ads", "users"
  add_foreign_key "collections", "sheets"
  add_foreign_key "collections", "users"
  add_foreign_key "relations", "sheets"
  add_foreign_key "relations", "songs"
  add_foreign_key "relations", "users"
  add_foreign_key "sheets", "users"
  add_foreign_key "songs", "users"
  add_foreign_key "tag_sheets", "sheets"
  add_foreign_key "tag_sheets", "tags"
  add_foreign_key "tag_sheets", "users"
  add_foreign_key "tags", "users"
end
