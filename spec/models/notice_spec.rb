# == Schema Information
#
# Table name: notices
#
#  id              :integer          not null, primary key
#  client_id       :integer
#  title           :string(200)
#  body            :text(65535)
#  notice_type     :string(255)
#  document_number :integer
#  document_url    :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  raw             :text(65535)
#  amended         :boolean          default(FALSE)
#  status          :string(16)       default("new")
#
# Indexes
#
#  index_notices_on_created_at  (created_at)
#  index_notices_on_status      (status)
#

require 'rails_helper'

RSpec.describe Notice, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
