# == Schema Information
#
# Table name: users
#
#  id                :bigint           not null, primary key
#  account_id        :integer
#  mail_alias        :string(8)
#  email             :string(200)
#  crypted_password  :string(200)
#  persistence_token :string(200)
#  login_count       :integer
#  last_login_at     :datetime
#  created_at        :datetime
#  updated_at        :datetime
#  user_type         :string(32)       default("attorney")
#  current_login_ip  :string
#  last_login_ip     :string
#  current_login_at  :datetime
#  password_expired  :boolean          default(FALSE)
#  perishable_token  :string           default(""), not null
#  time_zone         :string(100)
#  first_name        :string(60)
#  last_name         :string(60)
#
# Indexes
#
#  index_users_on_email             (email)
#  index_users_on_perishable_token  (perishable_token)
#

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
