class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer  "account_id"
      t.string   "mail_alias",        :limit => 8
      t.string   "email",             :limit => 200
      t.string   "crypted_password",  :limit => 200
      t.string   "persistence_token", :limit => 200
      t.integer  "login_count"
      t.datetime "last_login_at"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "user_type",         :limit => 32,  :default => "attorney"
      t.string   "current_login_ip"
      t.string   "last_login_ip"
      t.datetime "current_login_at"
      t.boolean  "password_expired",                 :default => false
      t.string   "perishable_token",                 :default => "",         :null => false
      t.string   "time_zone",         :limit => 100
      t.string   "first_name",        :limit => 60
      t.string   "last_name",         :limit => 60
    end

    add_index "users", ["email"], :name => "index_users_on_email"
    add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"  
  end
end
