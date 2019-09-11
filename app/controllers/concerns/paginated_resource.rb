# FIXME: This has grown to contain actual controller functionality
# It should probably be moved into some sort of PaginatedController class?
module PaginatedResource
  extend ActiveSupport::Concern

  @@filter_column = "title"
  @@per_page_limit = 15
  @@included_resources = []

  included do
    before_action :respond_with_json
    before_action :get_context
    before_action :get_resource, only: :show

    def index
      @resource = @context

      @resource = @resource.includes(*@@included_resources) if @@included_resources

      if @@filter_column
        if params[:q]
          search = "%#{params[:q]}%"

          @resource = @resource.where("#{@@filter_column} LIKE ?", search)
        end
      end

      @resource = @resource.order(sort_by)

      paginate_resource @resource
    end

    def show
      @resource = @context.find(params[:id])

      render json: @resource
    end

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

    def get_resource
      @resource = @context.find(params[:id])
    end

  end
end