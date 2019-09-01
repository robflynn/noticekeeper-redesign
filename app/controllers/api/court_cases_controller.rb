class Api::CourtCasesController < ApplicationController
  before_action :respond_with_json

  def index
    per_page_limit = 15

    @court_cases = current_user.cases.order(sort_by)

    paginate @court_cases, per_page: per_page_limit
  end

  def show
    @court_case = CourtCase.find(params[:id])

    render json: @court_case
  end

  private

  def respond_with_json
    request.format = :json
  end

  def sort_by
    column = "updated_at"
    sort = {}
    sort[column.to_sym] = sort_dir

    sort
  end

  def sort_dir
    :desc
  end
end

