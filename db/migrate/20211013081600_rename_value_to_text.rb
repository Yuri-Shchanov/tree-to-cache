class RenameValueToText < ActiveRecord::Migration[6.1]
  def change
    rename_column :db_tree_views, :value, :text
  end
end
