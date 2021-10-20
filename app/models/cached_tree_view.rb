class CachedTreeView < ApplicationRecord
  include Stateable
  include Destroyable
  include Treeable
  include TreeViewValidations

  def self.sync_nodes_with_db
    # Don't touch deleted nodes. Only opened can be modified.
    opened_nodes = opened
    ids = opened_nodes.pluck(:id)
    db_nodes = DbTreeView.get_nodes(ids).select(:id, :state).to_a
    db_nodes_ids = db_nodes.pluck(:id)

    opened_nodes.find_each do |node|
      if db_nodes_ids.exclude? node.id
        node.disabled!
        next
      end

      node.disabled! if db_nodes.find(node.id).first.disabled?
    end
  end
end
