# == Schema Information
#
# Table name: court_cases
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  case_name   :string
#  case_number :string
#  case_state  :string
#  case_type   :string
#  status      :integer          default("open")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_court_cases_on_user_id                (user_id)
#  index_court_cases_on_user_id_and_case_name  (user_id,case_name)
#  index_court_cases_on_user_id_and_status     (user_id,status)
#

require 'rails_helper'

RSpec.describe CourtCase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
