class Contact < ApplicationRecord
  include ContactType::Enum

  belongs_to :person_detail

  validates :email, presence: true, length: { maximum: 100 }, if: -> { contact_type_email? && email? }
  validates :mobile_number, presence: true, numericality: { only_integer: true }, length: { is: 11 }, if: -> { contact_type_mobile? && mobile_number? }

  before_validation :clear_attributes

  protected

  def clear_attributes
    attributes_to_clear = if contact_type_email?
      [ :mobile_number ]
    elsif contact_type_mobile?
      [ :email ]
    end
    super(attributes_to_clear)
  end
end
