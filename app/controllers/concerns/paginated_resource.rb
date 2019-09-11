module PaginatedResource
  extend ActiveSupport::Concern

  @@filter_column = "title"
  @@per_page_limit = 15

  included do
    before_action :respond_with_json
    before_action :get_context

    private

    def respond_with_json
      request.format = :json
    end

    def sort_by
      column = params[:sort_by] || "updated_at"
      sort = {}
      sort[column.to_sym] = sort_dir

      sort
    end

    def sort_dir
      params[:sort_dir] || :desc
    end

    def paginate_resource(resource)
      paginate resource, per_page: @per_page_limit
    end

  end
end