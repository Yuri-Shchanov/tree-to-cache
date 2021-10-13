class DbTreeViewsController < ApplicationController
  # GET /db_tree_views or /db_tree_views.json
  def show
    @db_tree_views = DbTreeView.select(:id, :text, :ancestry).arrange_serializable
  end
end
