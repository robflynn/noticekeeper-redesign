class CourtCaseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :status, :case_name, :case_number,
             :case_state, :case_type, :created_at,
             :updated_at

end