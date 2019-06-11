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

require 'rails_helper'

RSpec.describe CourtCase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
