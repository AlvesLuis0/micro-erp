class CreateOperationTypes < ActiveRecord::Migration[8.0]
  def change
    create_enum :operation_types, [ "purchase", "sale", "consignment", "exchange", "transfer", "other" ]
  end
end
