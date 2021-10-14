class CachedTreeView < ApplicationRecord
  include Stateable
  include TreeViewValidations
  has_ancestry

  # Переопределение метода для пометки об удалении вместо настоящего удаления
  def destroy
    transaction do
      disabled!
      children.each &:destroy
    end
  end
end
