class City < ApplicationRecord
  belongs_to :state

  validates :description, presence: true, length: { maximum: 60 }
end
