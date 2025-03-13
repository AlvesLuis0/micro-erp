module ContactType
  module Enum
    extend ActiveSupport::Concern

    included do
      enum :contact_type,
        {
          email: "email",
          mobile: "mobile"
        },
        prefix: true,
        validate: true
    end
  end
end
