class CreateSaleMethods < ActiveRecord::Migration[8.0]
  def change
    create_table :sale_methods do |t|
      t.string :description, limit: 60, null: false
      t.integer :order
      t.enum :status, enum_type: :statuses, null: false, default: "active", index: true
    end
  end
end
