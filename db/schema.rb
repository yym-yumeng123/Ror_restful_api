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

ActiveRecord::Schema.define(version: 2022_03_07_152004) do

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
  add_foreign_key "sheets", "users"
  add_foreign_key "songs", "users"
end
