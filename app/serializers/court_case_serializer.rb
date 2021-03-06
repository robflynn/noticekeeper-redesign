# == Schema Information
#
# Table name: clients
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  case_name   :string(100)
#  case_number :string(255)
#  case_state  :string(255)
#  case_type   :string(10)
#  created_at  :datetime
#  updated_at  :datetime
#  status      :string(16)       default(NULL)
#
# Indexes
#
#  index_clients_on_user_id  (user_id)
#

class CourtCaseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :case_name, :case_number,
             :case_state, :created_at,
             :updated_at, :total_claims

  def total_claims
    object.claims.map(&:amount).sum
  end
end
