class PersonDetail < ApplicationRecord
  include PersonType::Enum
  include MaritalStatus::Enum

  has_many :contacts
  has_one :address

  accepts_nested_attributes_for :contacts, :address

  validates :name, presence: true, length: { maximum: 100 }

  before_validation :clear_attributes

  with_options if: :person_type_individual? do |individual|
    individual.validates :cpf, presence: true, numericality: { only_integer: true }, uniqueness: true, length: { is: 11 }, if: :cpf?
    individual.validates :rg, presence: true, numericality: { only_integer: true }, uniqueness: true, length: { maximum: 15 }, if: :rg?
    individual.validates :issuing_agency, presence: true, length: { maximum: 20 }, if: :issuing_agency?
    individual.validates :birth_date, presence: true, comparison: { less_than_or_equal_to: -> { Date.today } }, if: :birth_date?
  end
  with_options if: :person_type_company? do |company|
    company.validates :cnpj, presence: true, numericality: { only_integer: true }, length: { is: 14 }, uniqueness: true, if: :cnpj?
    company.validates :state_registration, presence: true, length: { maximum: 20 }, if: :state_registration?
    company.validates :trade_name, presence: true, length: { maximum: 60 }, if: :trade_name?
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "person_type" ]
  end

  protected

  def clear_attributes
    attributes_to_clear = if person_type_individual?
      [ :cnpj, :state_registration, :trade_name ]
    elsif person_type_company?
      [ :cpf, :rg, :issuing_agency, :birth_date, :marital_status ]
    end
    super(attributes_to_clear)
  end
end
