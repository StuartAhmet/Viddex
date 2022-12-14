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

ActiveRecord::Schema[7.0].define(version: 2022_11_10_115623) do
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

  create_table "backgrounds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "title"
    t.string "public_uid"
    t.integer "x_axis", default: 350
    t.integer "y_axis", default: 250
    t.integer "width", default: 350
    t.integer "angle", default: 0
    t.index ["user_id"], name: "index_backgrounds_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "prospect_first"
    t.string "prospect_last"
    t.string "prospect_company"
    t.string "prospect_email"
    t.text "message"
    t.bigint "background_id"
    t.bigint "video_id"
    t.bigint "user_id"
    t.boolean "include_meeting_link", default: true
    t.string "projectable_type"
    t.bigint "projectable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "public_uid"
    t.integer "opacity", default: 70
    t.string "font", default: "permanent marker"
    t.integer "font_size", default: 38
    t.index ["background_id"], name: "index_projects_on_background_id"
    t.index ["projectable_type", "projectable_id"], name: "index_projects_on_projectable"
    t.index ["user_id"], name: "index_projects_on_user_id"
    t.index ["video_id"], name: "index_projects_on_video_id"
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
    t.string "last_name"
    t.string "company_name"
    t.string "industry"
    t.string "public_uid"
    t.string "provider"
    t.string "uid"
    t.string "full_name"
    t.string "avatar_url"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["public_uid"], name: "index_users_on_public_uid", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "cadence_step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "addressed"
    t.bigint "user_id"
    t.string "public_uid"
    t.string "rotation"
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "backgrounds", "users"
  add_foreign_key "projects", "backgrounds"
  add_foreign_key "projects", "users"
  add_foreign_key "projects", "videos"
  add_foreign_key "videos", "users"
end
