# == Schema Information
#
# Table name: notices
#
#  id              :bigint           not null, primary key
#  client_id       :integer
#  title           :string(200)
#  body            :text
#  notice_type     :string
#  document_number :integer
#  document_url    :string
#  raw             :text
#  amended         :boolean          default(FALSE)
#  status          :string(16)       default("new")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_notices_on_client_id   (client_id)
#  index_notices_on_created_at  (created_at)
#  index_notices_on_status      (status)
#

class Notice < ApplicationRecord    
    enum notice_type: { claim: "claim", document: "document" }
end
