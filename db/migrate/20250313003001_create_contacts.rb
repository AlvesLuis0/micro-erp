class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.references :person_detail, null: false, foreign_key: true
      t.enum :contact_type, enum_type: :contact_types, null: false, index: true
      t.string :email, limit: 100
      t.string :mobile_number, limit: 11
    end
  end
end
