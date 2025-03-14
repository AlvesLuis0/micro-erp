module MaritalStatus
  module Enum
    extend ActiveSupport::Concern

    included do
      enum :marital_status,
        {
          single: "single",
          married: "married",
          divorced: "divorced",
          widowed: "widowed"
        },
        prefix: true,
        validate: { allow_nil: true }
    end
  end
end
