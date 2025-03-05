module PaymentType
  extend ActiveSupport::Concern

  included do
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
      prefix: true,
      validate: true
  end
end
