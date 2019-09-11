class Api::DocumentsController < ApplicationController
  before_action :respond_with_json
  before_action :get_context

  @@per_page_limit = 100

  def index
    paginate @context.documents, per_page: @@per_page_limit
  end

  def show
    @document = @context.documents.find(params[:id])

    render json: @document
  end

  private

  def respond_with_json
    request.format = :json
  end

  def get_context
    @context = current_account.notices.find(params[:notice_id])
  end
end
