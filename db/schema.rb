# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_01_031446) do

  create_table "accounts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "owner_id"
    t.string "status", limit: 32, default: "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "customer_token"
    t.index ["customer_token"], name: "index_accounts_on_customer_token"
  end

  create_table "claims", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "client_id"
    t.integer "notice_id"
    t.integer "creditor_id"
    t.integer "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "secured", default: 0
    t.integer "priority", default: 0
    t.index ["notice_id"], name: "index_claims_on_notice_id"
  end

  create_table "clients", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "case_name", limit: 100
    t.string "case_number"
    t.string "case_state"
    t.string "case_type", limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "status", limit: 16, default: "open"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "comments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "commentable_id"
    t.string "commentable_type"
    t.integer "author_id"
    t.text "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
  end

  create_table "creditors", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "name", limit: 200
    t.text "address"
    t.string "phone"
    t.string "email", limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "priority", default: 0
    t.integer "attempts", default: 0
    t.text "handler"
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "notice_id"
    t.string "name", limit: 128
    t.string "filename", limit: 128
    t.integer "pages", default: 0
    t.boolean "synced", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "converted", default: false
    t.string "md5_hash", default: ""
    t.index ["md5_hash"], name: "index_documents_on_md5_hash"
    t.index ["notice_id"], name: "index_documents_on_notice_id"
  end

  create_table "events", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "notice_id"
    t.string "location", limit: 200
    t.datetime "event_start"
    t.datetime "event_end"
    t.string "title", limit: 200
    t.text "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "scheduled", default: true
    t.boolean "all_day", default: false
    t.string "date"
    t.string "time"
    t.index ["event_start"], name: "index_events_on_event_start"
    t.index ["notice_id"], name: "index_events_on_notice_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "incoming_emails", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "to", limit: 100
    t.string "from", limit: 100
    t.string "subject", limit: 200
    t.text "body"
    t.string "status", limit: 16, default: "new"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "headers"
  end

  create_table "invoices", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "account_id"
    t.integer "plan_id"
    t.integer "amount"
    t.string "status", default: "success"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["account_id"], name: "index_invoices_on_account_id"
  end

  create_table "mailing_list_entries", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notices", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "client_id"
    t.string "title", limit: 200
    t.text "body"
    t.string "notice_type"
    t.integer "document_number"
    t.string "document_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "raw"
    t.boolean "amended", default: false
    t.string "status", limit: 16, default: "new"
    t.index ["created_at"], name: "index_notices_on_created_at"
    t.index ["status"], name: "index_notices_on_status"
  end

  create_table "plans", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name", limit: 32
    t.string "title", limit: 64
    t.text "description"
    t.integer "price"
    t.integer "attorneys"
    t.integer "paralegals"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "active", default: false
    t.integer "weight", default: 0
    t.index ["active"], name: "index_plans_on_active"
    t.index ["weight"], name: "index_plans_on_weight"
  end

  create_table "subscriptions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "account_id"
    t.integer "plan_id"
    t.string "status", limit: 16, default: "trial"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_paralegals", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "paralegal_id"
    t.integer "attorney_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
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
