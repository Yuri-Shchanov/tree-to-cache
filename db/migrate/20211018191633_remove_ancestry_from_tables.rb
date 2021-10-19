class RemoveAncestryFromTables < ActiveRecord::Migration[6.1]
  def change
    remove_column :db_tree_views, :ancestry, :string, index: true
    remove_column :cached_tree_views, :ancestry, :string, index: true

    add_column :db_tree_views, :parent_id, :integer
    add_index :db_tree_views, :parent_id
    add_column :cached_tree_views, :parent_id, :integer
    add_index :cached_tree_views, :parent_id
  end
end
