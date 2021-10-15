class DbTreeViewsController < ApplicationController
  before_action :set_db_tree_views, only: :show

  # GET /db_tree_views or /db_tree_views.json
  def show; end

  def apply_changes
    if cnahges = DbTreeView.apply_changes(apply_changes_params[:db_tree_views])
      set_db_tree_views
      render :show
    else
      render json: {errors: cnahges[:erors]}, status: :unprocessable_entity
    end
  end

  private
  def apply_changes_params
    params.permit(db_tree_views: [:id, :text, :ancestry, :state])
  end

  def set_db_tree_views
    @db_tree_views = TreeViewDecorator.decorate(DbTreeView).list
  end
end
