class Api::CourtCasesController < ApplicationController
  before_action :respond_with_json

  def index
    per_page_limit = 10

    @court_cases = CourtCase.limit(per_page_limit)

    render json: {
      pages: {
        count: @court_cases.count,
        page: 1,
        per_page: per_page_limit,
        self: "",
        next: "",
        prev: ""
      },
      data: @court_cases,
      status: :success
    }
  end

  private def respond_with_json
    request.format = :json
  end
end

