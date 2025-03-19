class CreateEntryExit < ActiveRecord::Migration[8.0]
  def change
    create_enum :entry_exit, [ "entry", "exit", "symbolic" ]
  end
end
