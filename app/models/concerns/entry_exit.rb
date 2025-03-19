module EntryExit
  module Enum
    extend ActiveSupport::Concern

    included do
      enum :entry_exit,
        {
          entry: "entry",
          exit: "exit",
          symbolic: "symbolic"
        },
        prefix: true,
        validate: true
    end
  end
end
