module Stateable
  extend ActiveSupport::Concern
  included do
    enum state: %i[opened disabled]
  end

end