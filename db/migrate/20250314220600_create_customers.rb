class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.references :person_detail, null: false, foreign_key: true
      t.text :note, limit: 1000
      t.enum :status, enum_type: :statuses, null: false, index: true
      t.timestamps
    end
  end
end
