class NoticeSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :notice_type, :status, :amended, :body
  attributes :created_at, :updated_at
end

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