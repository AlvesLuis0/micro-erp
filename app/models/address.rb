class Address < ApplicationRecord
  belongs_to :person_detail
  belongs_to :city, optional: true

  validates :street, length: { maximum: 60, allow_nil: true }
  validates :complement, length: { maximum: 60, allow_nil: true }
  validates :zip_code, length: { maximum: 8, allow_nil: true }
  validates :neighborhood, length: { maximum: 60, allow_nil: true }
end
