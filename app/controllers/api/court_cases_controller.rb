class Api::CourtCasesController < ApplicationController
  include PaginatedResource

  def index
    @resource = @context
    @resource = @resource.includes(:claims)

    @per_page_limit = 15

    if params[:q]
      search = "%#{params[:q]}%"
      @resource = @resource.where("case_name LIKE ? OR case_number LIKE ?", search, search)
    end

    @resource = @resource.order(sort_by)

    puts @resource.to_sql

    paginate_resource @resource
  end

  def show
    @resource = CourtCase.find(params[:id])

    render json: @resource
  end

  private

  def get_context
    @context = current_user.cases
  end
end

