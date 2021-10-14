class CachedTreeViewsController < ApplicationController
  before_action :set_cached_tree_views, only: :index
  # GET /db_tree_views or /db_tree_views.json
  def index; end

  def create
    @cached_tree_view = CachedTreeView.find_or_initialize_by(cached_tree_view_parms)
    if @cached_tree_view.save
      set_cached_tree_views
      render :index
    else
      render json: {errors: @cached_tree_view.errors}, status: :unprocessable_entity
    end
  end

  private

  def cached_tree_view_parms
    params.permit(:id, :parent_id, :text, :ancestry)
  end

  def set_cached_tree_views
    @cached_tree_views = CachedTreeView.select(:id, :text, :ancestry, :state).arrange_serializable
  end
end
