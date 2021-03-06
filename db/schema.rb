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

ActiveRecord::Schema.define(version: 20140702205514) do

  create_table "animals", force: true do |t|
    t.string   "name"
    t.string   "sex"
    t.date     "birthdate"
    t.integer  "organisation_id", null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "animals", ["organisation_id"], name: "index_animals_on_organisation_id"

  create_table "organisations", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "organisations", ["confirmation_token"], name: "index_organisations_on_confirmation_token", unique: true
  add_index "organisations", ["email"], name: "index_organisations_on_email", unique: true
  add_index "organisations", ["reset_password_token"], name: "index_organisations_on_reset_password_token", unique: true

  create_table "profiles", force: true do |t|
    t.integer  "organisation_id",   null: false
    t.text     "description"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "logo_file_path"
  end

  add_index "profiles", ["name"], name: "index_profiles_on_name", unique: true
  add_index "profiles", ["organisation_id"], name: "index_profiles_on_organisation_id"

end
