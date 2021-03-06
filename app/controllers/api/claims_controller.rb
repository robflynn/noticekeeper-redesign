class Api::ClaimsController < ApplicationController
  include PaginatedResource

  @@filter_column = "amount"

  def index
    @claims = @context.claims
    @claims = @claims.includes(:creditor)

    if @@filter_column
      if params[:q]
        search = "%#{params[:q]}%"

        @claims = @claims.where("#{@@filter_column} LIKE ?", search)
      end
    end

    @claims = @claims.order(sort_by)


    paginate_resource @claims
  end

  private

  def get_context
    if params[:case_id].present?
      @context = current_account.cases.find(params[:case_id])
    else
      @per_page_limit = 15

      @context = current_account
    end
  end
end
