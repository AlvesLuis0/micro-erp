class PaymentMethodsController < ApplicationController
  include Crud::Backend

  protected

  def resource_params
    params.expect(payment_method: [ :description, :payment_type, :status ])
  end

  def model
    PaymentMethod
  end
end
