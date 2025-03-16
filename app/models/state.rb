class State < ApplicationRecord
  has_many :cities

  validates :description, presence: true, length: { maximum: 60 }
  validates :uf, presence: true, length: { is: 2 }

  def to_s
    description
  end
end
