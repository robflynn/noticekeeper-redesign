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

class Notice < ApplicationRecord
  enum notice_type: { claim: "claim", document: "document" }

  belongs_to :court_case, foreign_key: 'client_id'

  has_many :documents
  has_many :claims
  has_many :events

  def amended_version
    Notice.find_by(
      notice_type: self.notice_type,
      client_id: self.client_id,
      document_number: self.document_number,
      amended: false
    )
  end
end
