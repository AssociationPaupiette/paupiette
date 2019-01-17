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

ActiveRecord::Schema.define(version: 2018_12_17_130103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "ambassadorships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_ambassadorships_on_city_id"
    t.index ["user_id"], name: "index_ambassadorships_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: false
    t.string "slug", default: "", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "conversations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations_users", id: false, force: :cascade do |t|
    t.bigint "conversation_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.datetime "date"
    t.bigint "host_id"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "confirmed", default: 1
    t.integer "remaining"
    t.text "description"
    t.integer "formula"
    t.index ["host_id"], name: "index_meals_on_host_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "from_id"
    t.text "content"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "conversation_id"
    t.index ["from_id"], name: "index_messages_on_from_id"
  end

  create_table "preregistrations", force: :cascade do |t|
    t.string "first_name"
    t.string "email"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_preregistrations_on_city_id"
  end

  create_table "user_reviews", force: :cascade do |t|
    t.bigint "from_id"
    t.bigint "about_id"
    t.text "text"
    t.boolean "approved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["about_id"], name: "index_user_reviews_on_about_id"
    t.index ["from_id"], name: "index_user_reviews_on_from_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.text "description"
    t.text "specialties"
    t.string "reception_days"
    t.bigint "city_id"
    t.string "last_name"
    t.boolean "host", default: false
    t.boolean "admin", default: false
    t.string "slug", default: "", null: false
    t.boolean "active", default: true, null: false
    t.boolean "approved", default: false
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "preregistrations", "cities"
  add_foreign_key "user_reviews", "users", column: "about_id"
  add_foreign_key "user_reviews", "users", column: "from_id"
  add_foreign_key "users", "cities"
end
