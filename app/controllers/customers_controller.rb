class CustomersController < ApplicationController
  include Crud::Backend

  def index
    @q = Customer.includes(:person_detail).not_status_deleted.ransack(params[:q])
    @pagy, @resources = pagy(@q.result)
    render "layouts/index"
  end

  protected

  def resource_params
    params.expect(customer: [
      :description, :note, :status,
      person_detail_attributes: [
        :id, :name, :person_type, :cpf, :rg, :issuing_agency, :birth_date, :marital_status, :cnpj, :state_registration, :trade_name,
        address_attributes: [
          :id, :street, :number, :complement, :zip_code, :neighborhood, :city_id
        ],
        contacts_attributes: [ [
          :id, :contact_type, :email, :mobile_number
        ] ]
      ]
    ])
  end

  def model
    Customer
  end

  def instantiate_resource
    Customer.new(
      person_detail: PersonDetail.new(
        address: Address.new,
        contacts: [
          Contact.new(contact_type: :email),
          Contact.new(contact_type: :mobile),
          Contact.new(contact_type: :mobile),
          Contact.new(contact_type: :mobile)
        ]
      )
    )
  end
end
