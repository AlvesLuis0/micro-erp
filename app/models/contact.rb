class Contact < ApplicationRecord
  include ContactType::Enum

  belongs_to :person_detail

  validates :email, length: { maximum: 100 }, if: -> { contact_type_email? && email? }

  with_options if: :contact_type_mobile? do |mobile|
    mobile.validates :area_code, numericality: { only_integer: true }, length: { is: 2 }, if: :area_code
    mobile.validates :mobile_number, numericality: { only_integer: true }, length: { is: 9 }, if: :mobile_number
  end

  before_validation :clear_attributes

  protected

  def clear_attributes
    attributes_to_clear = if contact_type_email?
      [ :area_code, :mobile_number ]
    elsif contact_type_mobile?
      [ :email ]
    end
    super(attributes_to_clear)
  end
end
