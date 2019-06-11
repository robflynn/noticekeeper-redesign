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

ActiveRecord::Schema.define(version: 2019_05_28_033216) do

  create_table "court_cases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "case_name"
    t.string "case_number"
    t.string "case_state"
    t.string "case_type"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "case_name"], name: "index_court_cases_on_user_id_and_case_name"
    t.index ["user_id", "status"], name: "index_court_cases_on_user_id_and_status"
    t.index ["user_id"], name: "index_court_cases_on_user_id"
  end

  create_table "notices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "client_id"
    t.string "title", limit: 200
    t.text "body"
    t.string "notice_type"
    t.integer "document_number"
    t.string "document_url"
    t.text "raw"
    t.boolean "amended", default: false
    t.string "status", limit: 16, default: "new"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_notices_on_client_id"
    t.index ["created_at"], name: "index_notices_on_created_at"
    t.index ["status"], name: "index_notices_on_status"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "account_id"
    t.string "mail_alias", limit: 8
    t.string "email", limit: 200
    t.string "crypted_password", limit: 200
    t.string "persistence_token", limit: 200
    t.integer "login_count"
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "user_type", limit: 32, default: "attorney"
    t.string "current_login_ip"
    t.string "last_login_ip"
    t.datetime "current_login_at"
    t.boolean "password_expired", default: false
    t.string "perishable_token", default: "", null: false
    t.string "time_zone", limit: 100
    t.string "first_name", limit: 60
    t.string "last_name", limit: 60
    t.index ["email"], name: "index_users_on_email"
    t.index ["perishable_token"], name: "index_users_on_perishable_token"
  end

end
