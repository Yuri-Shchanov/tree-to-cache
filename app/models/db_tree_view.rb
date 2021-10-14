class DbTreeView < ApplicationRecord
  has_ancestry
  include Stateable

end
