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

ActiveRecord::Schema.define(version: 20170806030916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "postal_code"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "state"
    t.string   "city"
    t.string   "address"
    t.string   "address_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "neighborhood"
  end

  create_table "adoptions", force: :cascade do |t|
    t.integer  "pet_id"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "ong_id"
    t.integer  "status",     default: 0
    t.index ["ong_id"], name: "index_adoptions_on_ong_id", using: :btree
    t.index ["pet_id"], name: "index_adoptions_on_pet_id", using: :btree
    t.index ["user_id"], name: "index_adoptions_on_user_id", using: :btree
  end

  create_table "ages", force: :cascade do |t|
    t.string   "scala"
    t.string   "age"
    t.integer  "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_ages_on_pet_id", using: :btree
  end

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authorizations_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "datetime"
    t.integer  "ong_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ong_id"], name: "index_events_on_ong_id", using: :btree
  end

  create_table "information_banks", force: :cascade do |t|
    t.integer  "ong_id"
    t.string   "cnpj"
    t.string   "bank"
    t.string   "agency"
    t.string   "account_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["ong_id"], name: "index_information_banks_on_ong_id", using: :btree
  end

  create_table "ongs", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "site"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "cnpj"
    t.string   "email"
    t.string   "contact"
    t.text     "about_us"
    t.string   "logo"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "user_id"
    t.string   "description"
    t.integer  "address_id"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "pet_capacity"
    t.string   "facebook_url"
    t.index ["address_id"], name: "index_ongs_on_address_id", using: :btree
    t.index ["email"], name: "index_ongs_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_ongs_on_reset_password_token", unique: true, using: :btree
    t.index ["user_id"], name: "index_ongs_on_user_id", using: :btree
  end

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.string   "size"
    t.string   "pet_type"
    t.string   "breed"
    t.string   "gender"
    t.boolean  "vaccined"
    t.text     "deficiency"
    t.boolean  "castrated"
    t.text     "description"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "ong_id"
    t.boolean  "available",           default: true
    t.index ["ong_id"], name: "index_pets_on_ong_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "pet_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["pet_id"], name: "index_photos_on_pet_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "phone"
    t.string   "provider"
    t.string   "uid"
    t.text     "image"
    t.integer  "address_id"
    t.string   "facebook_url"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["address_id"], name: "index_users_on_address_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "adoptions", "ongs"
  add_foreign_key "adoptions", "pets"
  add_foreign_key "adoptions", "users"
  add_foreign_key "ages", "pets"
  add_foreign_key "authorizations", "users"
  add_foreign_key "events", "ongs"
  add_foreign_key "information_banks", "ongs"
  add_foreign_key "ongs", "addresses"
  add_foreign_key "ongs", "users"
  add_foreign_key "pets", "ongs"
  add_foreign_key "photos", "pets"
  add_foreign_key "users", "addresses"
end
