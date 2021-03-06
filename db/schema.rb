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

ActiveRecord::Schema.define(version: 20170606010354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body"
    t.string   "resource_id",   limit: 255, null: false
    t.string   "resource_type", limit: 255, null: false
    t.integer  "author_id"
    t.string   "author_type",   limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "attachments", force: :cascade do |t|
    t.integer  "flood_id"
    t.string   "upload_file_name",    limit: 255
    t.string   "upload_content_type", limit: 255
    t.integer  "upload_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["flood_id"], name: "index_attachments_on_flood_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.integer  "flood_id"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "upload1_file_name"
    t.string   "upload1_content_type"
    t.integer  "upload1_file_size"
    t.datetime "upload1_updated_at"
    t.string   "upload2_file_name"
    t.string   "upload2_content_type"
    t.integer  "upload2_file_size"
    t.datetime "upload2_updated_at"
    t.string   "upload3_file_name"
    t.string   "upload3_content_type"
    t.integer  "upload3_file_size"
    t.datetime "upload3_updated_at"
  end

  add_index "documents", ["flood_id"], name: "index_documents_on_flood_id", using: :btree

  create_table "floods", force: :cascade do |t|
    t.string   "first_name",              limit: 255
    t.string   "last_name",               limit: 255
    t.string   "email",                   limit: 255
    t.datetime "date_of_report"
    t.text     "description"
    t.string   "latitude",                limit: 255
    t.string   "longitude",               limit: 255
    t.decimal  "salinity"
    t.string   "salinity_units",          limit: 255
    t.decimal  "water_depth"
    t.string   "water_depth_units",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "location"
    t.string   "address",                 limit: 255
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

end
