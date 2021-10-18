class CachedTreeView < ApplicationRecord
  include Stateable
  include Destroyable
  include TreeViewValidations

  has_ancestry

  before_create :set_parent_state
  before_update :disable_descendants, if: -> {state_changed? && disabled?}

  private
  def set_parent_state
    self.state = :disabled if self.ancestors.any?(&:disabled?)
  end

  def disable_descendants
    descendants.map(&:disabled!)
  end
end
