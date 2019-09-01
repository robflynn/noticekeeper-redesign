class ApplicationController < ActionController::Base
  serialization_scope :view_context

  def current_user
    # Instantiate a dummy user
    User.new
  end
end
