class SaleMethodsController < ApplicationController
  include Crud::Backend

  protected

  def resource_params
    params.expect(sale_method: [ :description, :order, :status ])
  end

  def model
    SaleMethod
  end
end
