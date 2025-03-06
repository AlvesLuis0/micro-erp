class OperationCode < ApplicationRecord
  include Status
  include OperationType
  include EntryExit

  attribute :input_quantity_on_update, :boolean, default: true
  attribute :input_price_on_update, :boolean, default: true

  validates :description, presence: true, length: { maximum: 60 }
  validates :updates_stock, presence: false
  validates :input_quantity_on_create, presence: false
  validates :input_quantity_on_update, presence: false
  validates :input_price_on_create, presence: false
  validates :input_price_on_update, presence: false

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "description", "operation_type", "status" ]
  end
end
