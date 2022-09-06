# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_05_085221) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "alcool_profiles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.float "vineux", default: 0.0
    t.float "epicee", default: 0.0
    t.float "boise", default: 0.0
    t.float "animale", default: 0.0
    t.float "fruite", default: 0.0
    t.float "floral", default: 0.0
    t.float "herbace", default: 0.0
    t.float "cereale", default: 0.0
    t.float "empyreumatique", default: 0.0
    t.float "tourbe", default: 0.0
    t.string "clef"
    t.string "family"
    t.string "accroche"
    t.string "stars"
    t.string "photo_one_url"
    t.string "photo_two_url"
    t.string "photo_one"
    t.string "photo_two"
    t.index ["user_id"], name: "index_alcool_profiles_on_user_id"
  end

  create_table "aromas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "family_id"
    t.index ["family_id"], name: "index_aromas_on_family_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spirit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "rating", default: 5.0
    t.index ["spirit_id"], name: "index_experiences_on_spirit_id"
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.float "total_price"
    t.bigint "user_id", null: false
    t.bigint "spirit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spirit_id"], name: "index_orders_on_spirit_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "producers", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "location"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spirit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "percentages"
    t.index ["spirit_id"], name: "index_recommendations_on_spirit_id"
    t.index ["user_id"], name: "index_recommendations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "spirit_id"
    t.bigint "user_id"
    t.index ["spirit_id"], name: "index_reviews_on_spirit_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "spirit_aromas", force: :cascade do |t|
    t.bigint "aroma_id", null: false
    t.bigint "spirit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aroma_id"], name: "index_spirit_aromas_on_aroma_id"
    t.index ["spirit_id"], name: "index_spirit_aromas_on_spirit_id"
  end

  create_table "spirits", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.float "price"
    t.string "producer"
    t.text "description"
    t.string "color"
    t.string "country"
    t.float "degrees"
    t.boolean "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.float "vineux", default: 0.0
    t.float "epicee", default: 0.0
    t.float "boise", default: 0.0
    t.float "animale", default: 0.0
    t.float "fruite", default: 0.0
    t.float "floral", default: 0.0
    t.float "herbace", default: 0.0
    t.float "cereale", default: 0.0
    t.float "empyreumatique", default: 0.0
    t.float "tourbe", default: 0.0
    t.float "latitude"
    t.float "longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "alcool_profiles", "users"
  add_foreign_key "aromas", "families"
  add_foreign_key "experiences", "spirits"
  add_foreign_key "experiences", "users"
  add_foreign_key "orders", "spirits"
  add_foreign_key "orders", "users"
  add_foreign_key "recommendations", "spirits"
  add_foreign_key "recommendations", "users"
  add_foreign_key "reviews", "spirits"
  add_foreign_key "reviews", "users"
  add_foreign_key "spirit_aromas", "aromas"
  add_foreign_key "spirit_aromas", "spirits"
end
