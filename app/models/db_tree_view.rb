class DbTreeView < ApplicationRecord
  include Stateable
  include Destroyable
  include TreeViewValidations
  has_ancestry

  def self.apply_changes(data)
    errors = []
    transaction do
      data.each do |_index, node_data|
        new_node = find_or_initialize_by(id: node_data[:id])
        new_node.assign_attributes(node_data.except(:id))
        if new_node.disabled?
          new_node.destroy
        end
        errors << new_node.errors unless new_node.save
      end
    end
    return errors.present? ? errors : true
  end
end
