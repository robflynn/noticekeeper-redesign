class Api::NoticesController < ApplicationController
  before_action :respond_with_json
  before_action :get_context

  @@per_page_limit = 100

  def index
    paginate @context.notices, per_page: @@per_page_limit

  end

  def show
  end

  private

  def respond_with_json
    request.format = :json
  end

  def get_context
    if params[:case_id].present?
      @context = current_user.cases.find(params[:case_id])
    else
      @@per_page_limit = 15

      @context = current_user
    end
  end
end
