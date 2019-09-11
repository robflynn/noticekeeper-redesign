class Api::CourtCasesController < ApplicationController
  include PaginatedResource

  @@filter_column = "case_name"
  @@included_resources = [:claims]

  private

  def get_context
    @context = current_account.cases
  end
end

