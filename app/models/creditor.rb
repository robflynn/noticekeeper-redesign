# == Schema Information
#
# Table name: creditors
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(200)
#  address    :text(65535)
#  phone      :string(255)
#  email      :string(200)
#  created_at :datetime
#  updated_at :datetime
#

class Creditor < ApplicationRecord
end
