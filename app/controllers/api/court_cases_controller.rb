class Api::CourtCasesController < ApplicationController
  include PaginatedResource

  def filter_column
    "case_name"
  end

  def included_resources
    [:claims]
  end

  def get_context
    @context = current_account.cases
  end
end

