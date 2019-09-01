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

class NoticeSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :case_id, :title, :notice_type, :status, :amended, :body
  attributes :document_number, :document_url
  attributes :created_at, :updated_at

  def case_id
    object.client_id
  end
end
