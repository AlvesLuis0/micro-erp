class SaleMethod < ApplicationRecord
  include Status::Enum

  acts_as_list

  validates :description, presence: true, length: { maximum: 60 }
end
