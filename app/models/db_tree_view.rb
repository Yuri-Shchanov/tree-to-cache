class DbTreeView < ApplicationRecord
  include Stateable
  include TreeViewValidations
  has_ancestry
end
