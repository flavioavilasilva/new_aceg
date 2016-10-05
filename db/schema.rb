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

ActiveRecord::Schema.define(version: 20161005002044) do

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "datetime"
    t.integer  "ong_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ong_id"], name: "index_events_on_ong_id"
  end

  create_table "ongs", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "site"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "cnpj"
    t.string   "email"
    t.string   "contact"
    t.text     "about_us"
    t.string   "logo"
    t.boolean  "acept_pets"
    t.string   "state"
    t.string   "city"
    t.string   "street"
    t.string   "zipcode"
    t.string   "neighborhood"
    t.string   "number"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "size"
    t.string   "pet_type"
    t.string   "breed"
    t.string   "gender"
    t.boolean  "vaccined"
    t.text     "deficiency"
    t.boolean  "castrated"
    t.text     "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "ong_id"
    t.index ["ong_id"], name: "index_pets_on_ong_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
