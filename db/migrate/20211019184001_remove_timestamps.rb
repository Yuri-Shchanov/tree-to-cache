class RemoveTimestamps < ActiveRecord::Migration[6.1]
  def change
    remove_column :db_tree_views, :created_at, :timestamp
    remove_column :db_tree_views, :updated_at, :timestamp
    remove_column :cached_tree_views, :created_at, :timestamp
    remove_column :cached_tree_views, :updated_at, :timestamp
  end
end
