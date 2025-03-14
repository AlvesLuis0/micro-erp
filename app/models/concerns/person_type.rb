module PersonType
  module Enum
    extend ActiveSupport::Concern

    included do
      enum :person_type,
        {
          individual: "individual",
          company: "company"
        },
        prefix: true,
        validate: true
    end
  end
end
