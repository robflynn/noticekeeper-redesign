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

class CourtCase < ApplicationRecord
  self.table_name = 'clients'

  has_many :notices, foreign_key: 'client_id'

  enum status: { active: "active", inactive: "inactive" }
end
