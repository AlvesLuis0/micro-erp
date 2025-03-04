class SaleMethodsController < ApplicationController
  before_action :set_sale_method, only: %i[ edit update destroy ]

  # GET /sale_methods or /sale_methods.json
  def index
    @q = SaleMethod.not_deleted.ransack(params[:q])
    @pagy, @records = pagy(@q.result)
    render "layouts/index"
  end

  # GET /sale_methods/new
  def new
    @record = SaleMethod.new
    render "layouts/form"
  end

  # GET /sale_methods/1/edit
  def edit
    render "layouts/form"
  end

  # POST /sale_methods or /sale_methods.json
  def create
    @record = SaleMethod.new(sale_method_params)
    if @record.save
      redirect_to edit_sale_method_path(@record), notice: "Sale method was successfully created."
    else
      render "layouts/form", status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sale_methods/1 or /sale_methods/1.json
  def update
    if @record.update(sale_method_params)
      redirect_to edit_sale_method_path(@record), notice: "Sale method was successfully updated."
    else
      render "layouts/form", status: :unprocessable_entity
    end
  end

  # DELETE /sale_methods/1 or /sale_methods/1.json
  def destroy
    @record.deleted!
    redirect_to sale_methods_path, status: :see_other, notice: "Sale method was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_method
      @record = SaleMethod.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def sale_method_params
      params.expect(sale_method: [ :description, :order, :status ])
    end
end
