class OperationCode < ApplicationRecord
  include Status::Enum
  include OperationType::Enum
  include EntryExit::Enum

  attribute :input_quantity_on_update, :boolean, default: true
  attribute :input_price_on_update, :boolean, default: true

  validates :description, presence: true, length: { maximum: 60 }

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "description", "operation_type", "status" ]
  end
end
