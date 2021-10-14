module TreeViewValidations
  extend ActiveSupport::Concern

  included do
    validate :cannot_modify_deleted_nodes, on: :update
    validate :cannot_undo_delete, on: :update

    private

    def cannot_modify_deleted_nodes
      if disabled? && text_changed?
        errors.add(:text, "Нельзя редактировать удаленный элемент")
      end
    end

    def cannot_undo_delete
      if state_was == "disabled" && state_changed?
        errors.add(:text, "Нельзя пересоздать удаленный элемент")
      end
    end
  end
end
