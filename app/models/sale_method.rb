class SaleMethod < ApplicationRecord
  include Status

  validates :description, presence: true, length: { maximum: 60 }
end
