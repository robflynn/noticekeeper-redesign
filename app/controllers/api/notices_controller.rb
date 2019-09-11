class Api::NoticesController < ApplicationController
  include PaginatedResource

  @@filter_column = "title"

  def index
    @notices = @context.notices

    if @@filter_column
      if params[:q]
        search = "%#{params[:q]}%"

        @notices = @notices.where("#{@@filter_column} LIKE ?", search)
      end
    end

    @notices = @notices.order(sort_by)

    paginate_resource @notices
  end

  def show
    @notice = @context.notices.find(params[:id])

    render json: @notice
  end

  private

  def get_context
    if params[:case_id].present?
      @context = current_user.cases.find(params[:case_id])
    else
      @per_page_limit = 15

      @context = current_user
    end
  end
end
