module EntryExit
  extend ActiveSupport::Concern

  included do
    enum :entry_exit,
      {
        entry: "entry",
        exit: "exit"
      },
      prefix: true,
      validate: true
  end
end
