# == Schema Information
#
# Table name: court_cases
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  name        :string
#  case_number :string
#  state       :string
#  status      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_court_cases_on_user_id             (user_id)
#  index_court_cases_on_user_id_and_name    (user_id,name)
#  index_court_cases_on_user_id_and_status  (user_id,status)
#

class CourtCase < ApplicationRecord
  enum status: { open: 0, closed: 1 }
end
