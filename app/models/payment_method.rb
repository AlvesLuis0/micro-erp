class PaymentMethod < ApplicationRecord
  include Status

  enum :payment_type,
    {
      cash: "cash",
      credit_card: "credit_card",
      debit_card: "debit_card",
      bank_transfer: "bank_transfer",
      installment: "installment",
      eletronic_wallet: "eletronic_wallet",
      other: "other"
    },
    validate: true

  validates :description, presence: true, length: { maximum: 60 }

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "description", "payment_type", "status" ]
  end
end
