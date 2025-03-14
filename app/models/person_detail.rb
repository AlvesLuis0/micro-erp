class PersonDetail < ApplicationRecord
  include PersonType::Enum
  include MaritalStatus::Enum

  has_many :contacts

  validates :name, presence: true, length: { maximum: 100 }

  before_validation :clear_attributes

  with_options if: :person_type_individual? do |individual|
    individual.validates :cpf, length: { is: 11 }, uniqueness: true, if: :cpf?
    individual.validates :rg, length: { maximum: 15 }, uniqueness: true, if: :rg?
    individual.validates :issuing_agency, length: { maximum: 20 }, if: :issuing_agency?
    individual.validates :birth_date, comparison: { less_than_or_equal_to: Date.today }, if: :birth_date?
  end

  with_options if: :person_type_company? do |individual|
    individual.validates :cnpj, length: { is: 14 }, uniqueness: true, if: :cnpj
    individual.validates :state_registration, length: { maximum: 20 }, if: :state_registration?
    individual.validates :trade_name, length: { maximum: 60 }, if: :trade_name?
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
