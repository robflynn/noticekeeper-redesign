class Api::DocumentsController < ApplicationController
  include PaginatedResource

  def get_context
    @context = current_account.notices.find(params[:notice_id])
  end

  def per_page_limit
    100
  end
end
