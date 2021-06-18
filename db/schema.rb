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

ActiveRecord::Schema.define(version: 20210618064202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.string   "hex_value"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "order"
  end

  create_table "configs", force: :cascade do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "email_status"
    t.string   "email_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "project_tiles", force: :cascade do |t|
    t.integer  "tile_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_tiles_on_project_id", using: :btree
    t.index ["tile_id"], name: "index_project_tiles_on_tile_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "filename"
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.index ["role_id"], name: "index_roles_users_on_role_id", using: :btree
    t.index ["user_id"], name: "index_roles_users_on_user_id", using: :btree
  end

  create_table "tile_types", force: :cascade do |t|
    t.string   "key"
    t.string   "value"
    t.float    "centimeters"
    t.float    "inches"
    t.boolean  "active"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "shape",       default: "square"
  end

  create_table "tiles", force: :cascade do |t|
    t.string   "url"
    t.integer  "tile_type_id"
    t.boolean  "active",             default: true
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "sku"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",                 default: true
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "email"
    t.json     "tokens"
    t.string   "reference"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "location"
    t.string   "address"
    t.string   "phone"
    t.string   "zip"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "project_tiles", "projects"
  add_foreign_key "project_tiles", "tiles"
  add_foreign_key "projects", "users"
  add_foreign_key "roles_users", "roles"
  add_foreign_key "roles_users", "users"
end
