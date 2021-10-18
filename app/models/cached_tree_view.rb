class CachedTreeView < ApplicationRecord
  include Stateable
  include Destroyable
  include Treeable
  include TreeViewValidations
end
