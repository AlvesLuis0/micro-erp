class CreatePersonDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :person_details do |t|
      t.string :name, limit: 100, null: false
      t.enum :person_type, enum_type: :person_types, index: true, null: true

      t.string :cpf, limit: 11
      t.string :rg, limit: 15
      t.string :issuing_agency, limit: 20
      t.date :birth_date
      t.enum :marital_status, enum_type: :marital_statuses, index: true

      t.string :cnpj, limit: 14
      t.string :state_registration, limit: 20
      t.string :trade_name, limit: 60
    end

    add_index :person_details, :cpf, unique: true, where: "cpf IS NOT NULL"
    add_index :person_details, :rg, unique: true, where: "rg IS NOT NULL"
    add_index :person_details, :cnpj, unique: true, where: "cnpj IS NOT NULL"
  end
end
