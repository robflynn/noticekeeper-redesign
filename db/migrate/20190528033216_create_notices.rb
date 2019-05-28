class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.integer  "client_id"
      t.string   "title",           :limit => 200
      t.text     "body"
      t.string   "notice_type"
      t.integer  "document_number"
      t.string   "document_url"
      t.text     "raw"
      t.boolean  "amended",                        :default => false
      t.string   "status",          :limit => 16,  :default => "new"
  
      t.timestamps
    end

    add_index "notices", ["client_id"], :name => "index_notices_on_client_id"
    add_index "notices", ["created_at"], :name => "index_notices_on_created_at"
    add_index "notices", ["status"], :name => "index_notices_on_status"  
  end
end
