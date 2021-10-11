class CreateDbTreeViews < ActiveRecord::Migration[6.1]
  def change
    create_table :db_tree_views do |t|
      t.string :value, null: false
      t.string :ancestry, index: true

      t.timestamps
    end
  end
end
