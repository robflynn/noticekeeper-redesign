class Api::EventsController < ApplicationController
  include PaginatedResource

  def index
    if @@filter_column
      if params[:q]
        search = "%#{params[:q]}%"

        @resource = @resource.where("#{@@filter_column} LIKE ?", search)
      end
    end

    @resource = @resource.order(sort_by)

    paginate_resource @resource
  end


  private

  def get_context
    if params[:case_id].present?
      @context = current_user.cases.find(params[:case_id])

      if params[:notice_id].present?
        @context = @context.notices.find(params[:notice_id])
      end
    else
      @context = current_user

      if params[:notice_id].present?
        @context = @context.notices.find(params[:notice_id])
      end
    end
  end

  def get_resource
    @resource = @context.events
  end

end
