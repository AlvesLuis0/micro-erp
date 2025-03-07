module Status
  module Enum
    extend ActiveSupport::Concern

    included do
      enum :status,
        {
          active: "active",
          inactive: "inactive",
          deleted: "deleted"
        },
        prefix: true,
        validate: true,
        default: :active
    end
  end
end
