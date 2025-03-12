class CreateCities < ActiveRecord::Migration[8.0]
  def change
    create_table :cities do |t|
      t.string :description, null: false, limit: 60
      t.references :state, null: false, foreign_key: true
    end
  end
end
