class ApplicationController < ActionController::Base
  serialization_scope :view_context

  def current_user
    User.find(1)
  end

  def current_account
    Account.find(1)
  end
end
