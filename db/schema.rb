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

ActiveRecord::Schema.define(version: 20160212122527) do

  create_table "common_codes", primary_key: "common_code_id", force: :cascade do |t|
    t.text     "common_code_type"
    t.integer  "common_code_detail_id"
    t.text     "name_korean"
    t.boolean  "yn_use",                default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "images", primary_key: "image_id", force: :cascade do |t|
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "pdfs", primary_key: "pdf_id", force: :cascade do |t|
    t.integer  "presentation_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.index ["presentation_id"], name: "index_pdfs_on_presentation_id"
  end

  create_table "presentations", primary_key: "presentation_id", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "title"
    t.text     "subtitle"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_presentations_on_user_id"
  end

  create_table "users", primary_key: "user_id", force: :cascade do |t|
    t.text     "email"
    t.text     "password"
    t.text     "fullname"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", primary_key: "video_id", force: :cascade do |t|
    t.integer  "presentation_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.index ["presentation_id"], name: "index_videos_on_presentation_id"
  end

end
