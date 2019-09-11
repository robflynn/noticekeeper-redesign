# == Schema Information
#
# Table name: claims
#
#  id          :integer          not null, primary key
#  client_id   :integer
#  notice_id   :integer
#  creditor_id :integer
#  amount      :integer
#  created_at  :datetime
#  updated_at  :datetime
#  secured     :integer          default(0)
#  priority    :integer          default(0)
#
# Indexes
#
#  index_claims_on_notice_id  (notice_id)
#

class ClaimSerializer < ActiveModel::Serializer
  attributes :id, :notice_id, :creditor_id, :amount, :created_at, :updated_at, :secured, :priority

  belongs_to :creditor
end
