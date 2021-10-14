class CachedTreeViewsController < ApplicationController
  before_action :set_cached_tree_views, only: :index
  before_action :set_cached_tree_view, only: %i(update destroy)
  # GET /db_tree_views or /db_tree_views.json
  def index; end

  def create
    @cached_tree_view = CachedTreeView.find_or_initialize_by(create_cached_tree_view_params)
    if @cached_tree_view.save
      set_cached_tree_views
      render :index
    else
      render json: { errors: @cached_tree_view.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @cached_tree_view.update(update_cached_tree_view_params)
      render json: { status: :ok }
    else
      render json: { errors: @cached_tree_view.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    if @cached_tree_view.destroy
      set_cached_tree_views
      render :index
    else
      render json: { errors: @cached_tree_view.errors }, status: :unprocessable_entity
    end
  end

  private

  def create_cached_tree_view_params
    params.permit(:id, :text, :ancestry)
  end

  def update_cached_tree_view_params
    params.permit(:text)
  end

  def set_cached_tree_views
    @cached_tree_views = CachedTreeView.select(:id, :text, :ancestry, :state).arrange_serializable do |parent, children|
      {
        children: children,
        id: parent.id,
        text: ERB::Util.h(parent.text),
        data: {
          ancestry: parent.ancestry,
        },
        state: parent.state,
      }
    end
  end

  def set_cached_tree_view
    @cached_tree_view = CachedTreeView.find(params[:id])
  end
end
