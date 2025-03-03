class SaleMethod < ApplicationRecord
  include Status

  validates :description, presence: true, length: { maximum: 60 }

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "description", "order", "status" ]
  end
end
