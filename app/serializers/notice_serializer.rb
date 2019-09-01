class NoticeSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :case_id, :title, :notice_type, :status, :amended, :body
  attributes :document_number, :document_url
  attributes :created_at, :updated_at

  def case_id
    object.client_id
  end
end
