class PaymentMethod < ApplicationRecord
  include Status::Enum
  include PaymentType::Enum

  validates :description, presence: true, length: { maximum: 60 }

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "description", "payment_type", "status" ]
  end
end
