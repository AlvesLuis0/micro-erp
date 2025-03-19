class OperationCodesController < ApplicationController
  include Crud::Backend

  protected

  def resource_params
    params.expect(operation_code: [
      :description, :operation_type, :entry_exit,
      :input_quantity_on_create, :input_quantity_on_update,
      :input_price_on_create, :input_price_on_update, :status
    ])
  end

  def model
    OperationCode
  end
end
