class SaleMethodsController < ApplicationController
  before_action :set_sale_method, only: %i[ edit update destroy ]

  # GET /sale_methods or /sale_methods.json
  def index
    @sale_methods = SaleMethod.not_deleted
  end

  # GET /sale_methods/new
  def new
    @sale_method = SaleMethod.new
    render :form
  end

  # GET /sale_methods/1/edit
  def edit
    render :form
  end

  # POST /sale_methods or /sale_methods.json
  def create
    @sale_method = SaleMethod.new(sale_method_params)
    if @sale_method.save
      redirect_to edit_sale_method_path(@sale_method), notice: "Sale method was successfully created."
    else
      render :form, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sale_methods/1 or /sale_methods/1.json
  def update
    if @sale_method.update(sale_method_params)
      redirect_to edit_sale_method_path(@sale_method), notice: "Sale method was successfully updated."
    else
      render :form, status: :unprocessable_entity
    end
  end

  # DELETE /sale_methods/1 or /sale_methods/1.json
  def destroy
    @sale_method.deleted!
    redirect_to sale_methods_path, status: :see_other, notice: "Sale method was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_method
      @sale_method = SaleMethod.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def sale_method_params
      params.expect(sale_method: [ :description, :order, :status ])
    end
end
