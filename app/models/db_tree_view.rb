class DbTreeView < ApplicationRecord
  include Stateable
  include Destroyable
  include Treeable
  include TreeViewValidations

  def self.apply_changes(data)
    errors = []
    transaction do
      data.each do |_index, node_data|
        new_node = find_or_initialize_by(id: node_data[:id])
        # Don't save persisted disabled records
        next if new_node.persisted? && new_node.disabled?

        new_node.assign_attributes(node_data.except(:id))
        # Don't save new records without parent
        next if (new_node.parent.nil? || new_node.parent.disabled?) && !new_node.persisted?

        if new_node.disabled?
          new_node.destroy
        end
        errors << new_node.errors unless new_node.save
      end
    end
    return errors.present? ? errors : true
  end

  def self.get_nodes(ids)
    where(id: ids)
  end
end
