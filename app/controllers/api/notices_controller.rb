class Api::NoticesController < ApplicationController
  include PaginatedResource

  def filter_column
    "title"
  end

  def get_context
    if params[:case_id].present?
      @context = current_account.cases.find(params[:case_id]).notices
    else
      @context = current_account.notices
    end
  end
end
