# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
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
#  current_login_ip  :string(255)
#  last_login_ip     :string(255)
#  current_login_at  :datetime
#  password_expired  :boolean          default(FALSE)
#  perishable_token  :string(255)      default(""), not null
#  time_zone         :string(100)
#  first_name        :string(60)
#  last_name         :string(60)
#
# Indexes
#
#  index_users_on_email             (email)
#  index_users_on_perishable_token  (perishable_token)
#

class User < ApplicationRecord
  has_many :cases, class_name: 'CourtCase'
  has_many :notices, through: :court_cases
  has_many :claims, through: :notices
  has_many :events, through: :notices
end
