# == Schema Information
#
# Table name: accounts
#
#  id             :integer          not null, primary key
#  owner_id       :integer
#  status         :string(32)       default("pending")
#  created_at     :datetime
#  updated_at     :datetime
#  customer_token :string(255)
#
# Indexes
#
#  index_accounts_on_customer_token  (customer_token)
#

class Account < ApplicationRecord
  has_many :users
  has_many :cases, through: :users, class_name: 'CourtCase'
  has_many :notices, through: :cases
  has_many :claims, through: :notices
  has_many :events, through: :notices
end
