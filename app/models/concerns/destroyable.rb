module Destroyable
  extend ActiveSupport::Concern
  included do
    # Переопределение метода для пометки об удалении вместо настоящего удаления
    def destroy
      transaction do
        disabled!
        children.each &:destroy
      end
    end
  end

end