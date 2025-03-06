class OperationCodesController < ApplicationController
  include Crud

  protected

  def record_params
    params.expect(operation_code: [
      :description, :operation_type, :entry_exit, :updates_stock,
      :input_quantity_on_create, :input_quantity_on_update,
      :input_price_on_create, :input_price_on_update, :status
    ])
  end

  def model
    OperationCode
  end
end
