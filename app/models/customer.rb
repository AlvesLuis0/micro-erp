class Customer < ApplicationRecord
  include Status::Enum

  belongs_to :person_detail

  accepts_nested_attributes_for :person_detail

  validates :note, presence: true, length: { maximum: 1000 }, if: :note?

  def self.ransackable_associations(auth_object = nil)
    [ "person_detail" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "created_at", "status" ]
  end
end
