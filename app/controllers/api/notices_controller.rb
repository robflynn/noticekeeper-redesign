class Api::NoticesController < ApplicationController
  include PaginatedResource

  def index
    @per_page_limit = 100

    @notices = @context.notices

    if params[:q]
      search = "%#{params[:q]}%"

      @notices = @notices.where("title LIKE ?", search)
    end


    paginate_resource @notices
  end

  def show
    @notice = @context.notices.find(params[:id])

    render json: @notice
  end

  private

  def respond_with_json
    request.format = :json
  end

  def get_context
    if params[:case_id].present?
      @context = current_user.cases.find(params[:case_id])
    else
      @per_page_limit = 15

      @context = current_user
    end
  end
end
