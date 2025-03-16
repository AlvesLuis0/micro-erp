class CreatePersonDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :person_details do |t|
      t.string :name, limit: 100, null: false
      t.enum :person_type, enum_type: :person_types, index: true, null: false

      t.string :cpf, limit: 11, index: true
      t.string :rg, limit: 15, index: true
      t.string :issuing_agency, limit: 20
      t.date :birth_date
      t.enum :marital_status, enum_type: :marital_statuses, index: true

      t.string :cnpj, limit: 14, index: true
      t.string :state_registration, limit: 20
      t.string :trade_name, limit: 60
    end
  end
end
