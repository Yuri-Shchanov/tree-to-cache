class CachedTreeView < ApplicationRecord
  include Stateable
  include Destroyable
  include Treeable
  include TreeViewValidations

  def self.sync_nodes_with_db
    all_nodes = all
    ids = all_nodes.pluck(:id)
    db_nodes = DbTreeView.get_nodes(ids).select(:id, :state).to_a
    db_nodes_ids = db_nodes.pluck(:id)

    all_nodes.find_each do |node|
      if db_nodes_ids.exclude? node.id
        node.disabled!
        next
      end

      node.disabled! if db_nodes.find(node.id).first.disabled?
    end
  end
end
