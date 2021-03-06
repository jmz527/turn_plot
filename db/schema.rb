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

ActiveRecord::Schema.define(version: 20150720163459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "correspondents", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "second_user_id"
    t.integer  "letter_count",   default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "correspondents", ["second_user_id"], name: "index_correspondents_on_second_user_id", using: :btree
  add_index "correspondents", ["user_id"], name: "index_correspondents_on_user_id", using: :btree

  create_table "letters", force: :cascade do |t|
    t.string   "send_to",          default: "",    null: false
    t.string   "subject",          default: "",    null: false
    t.text     "content",          default: "",    null: false
    t.integer  "correspondent_id"
    t.boolean  "has_read",         default: false
    t.boolean  "trash",            default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "letters", ["correspondent_id"], name: "index_letters_on_correspondent_id", using: :btree

  create_table "plots", force: :cascade do |t|
    t.string   "title",       default: "My New Plot",  null: false
    t.text     "content",     default: "Hello World!", null: false
    t.boolean  "active_plot", default: false
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "plots", ["user_id"], name: "index_plots_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "x",                      default: 0,  null: false
    t.integer  "y",                      default: 0,  null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
