class CreateContactTypes < ActiveRecord::Migration[8.0]
  def change
    create_enum :contact_types, [ "email", "mobile" ]
  end
end
