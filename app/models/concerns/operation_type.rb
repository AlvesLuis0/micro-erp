module OperationType
  module Enum
    extend ActiveSupport::Concern

    included do
      enum :operation_type,
        {
          purchase: "purchase",
          sale: "sale",
          consignment: "consignment",
          exchange: "exchange",
          transfer: "transfer",
          other: "other"
        },
        prefix: true,
        validate: true
    end
  end
end
