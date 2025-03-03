class CreateStatuses < ActiveRecord::Migration[8.0]
  def change
    create_enum :statuses, [ "active", "inactive", "deleted" ]
  end
end
