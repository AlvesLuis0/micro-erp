class PersonDetail < ApplicationRecord
  has_many :contacts

  validates :name, presence: true, length: { maximum: 100 }
end
