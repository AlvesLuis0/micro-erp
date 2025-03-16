class City < ApplicationRecord
  belongs_to :state

  validates :description, presence: true, length: { maximum: 60 }

  def self.ransackable_attributes(auth_object = nil)
    [ "description" ]
  end

  def to_s
    description
  end
end
