class CreateMaritalStatus < ActiveRecord::Migration[8.0]
  def change
    create_enum :marital_statuses, [ "single", "married", "divorced", "widowed" ]
  end
end
