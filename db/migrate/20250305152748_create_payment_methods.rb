class CreatePaymentMethods < ActiveRecord::Migration[8.0]
  def change
    create_table :payment_methods do |t|
      t.string :description, null: false, limit: 60
      t.enum :payment_type, enum_type: :payment_types, null: false, index: true
      t.enum :status, enum_type: :statuses, null: false, default: "active", index: true
    end
  end
end
