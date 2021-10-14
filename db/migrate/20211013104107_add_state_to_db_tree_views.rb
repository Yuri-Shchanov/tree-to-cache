class AddStateToDbTreeViews < ActiveRecord::Migration[6.1]
  def change
    add_column :db_tree_views, :state, :integer, default: DbTreeView.states[:opened]
  end
end
