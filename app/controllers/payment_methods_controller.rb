class PaymentMethodsController < ApplicationController
  include Crud

  protected

  def record_params
    params.expect(payment_method: [ :description, :payment_type, :status ])
  end

  def model
    PaymentMethod
  end
end
