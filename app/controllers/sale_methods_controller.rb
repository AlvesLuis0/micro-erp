class SaleMethodsController < ApplicationController
  include Crud

  protected

  def record_params
    params.expect(sale_method: [ :description, :order, :status ])
  end

  def model
    SaleMethod
  end
end
