class AddCachedTreeViews < ActiveRecord::Migration[6.1]
  def change
    create_table :cached_tree_views do |t|
      t.string :ancestry, index: true
      t.string :text, null: false
      t.integer :state, default: CachedTreeView.states[:opened]

      t.timestamps
    end
  end
end
