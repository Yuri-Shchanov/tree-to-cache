class CachedTreeView < ApplicationRecord
  include Stateable
  include Destroyable
  include TreeViewValidations
  has_ancestry
end
