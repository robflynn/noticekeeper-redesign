class Api::EventsController < ApplicationController
  include PaginatedResource

  private

  def get_context
    @context = current_account

    if params[:case_id].present?
      @context = @context.cases.find(params[:case_id])

      if params[:notice_id].present?
        @context = @context.notices.find(params[:notice_id])
      end
    else
      if params[:notice_id].present?
        @context = @context.notices.find(params[:notice_id])
      end
    end

    @context = @context.events
  end
end
