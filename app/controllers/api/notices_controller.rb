class Api::NoticesController < ApplicationController
  include PaginatedResource

  @@filter_column = "title"

  private

  def get_context
    if params[:case_id].present?
      @context = current_account.cases.find(params[:case_id]).notices
    else
      @per_page_limit = 15

      @context = current_account.notices
    end
  end
end
