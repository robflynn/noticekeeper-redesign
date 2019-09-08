class Api::CourtCasesController < ApplicationController
  include PaginatedResource

  def index
    @court_cases = @context

    if params[:q]
      search = "%#{params[:q]}%"
      @court_cases = @court_cases.where("case_name LIKE ? OR case_number LIKE ?", search, search)
    end

    @court_cases = @court_cases.order(sort_by)

    puts @court_cases.to_sql

    paginate_resource @court_cases
  end

  def show
    @court_case = CourtCase.find(params[:id])

    render json: @court_case
  end

  private

  def get_context
    @context = current_user.cases
  end
end

