class SaleMethodsController < ApplicationController
  include Crud::Backend

  def index
    @resources = SaleMethod.not_status_deleted.order(:position)
    render "layouts/sortable-index"
  end

  def update_position
    set_resource
    @resource.update!(position: params[:position])
    head :ok
  end

  protected

  def resource_params
    params.expect(sale_method: [ :description, :position, :status ])
  end

  def model
    SaleMethod
  end
end
