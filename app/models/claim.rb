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

class Claim < ApplicationRecord
  belongs_to :notice

  belongs_to :creditor
end
