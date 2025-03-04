class ApplicationController < ActionController::Base
  include Pagy::Backend
  include RecordHelper

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_record, only: %i[ edit update destroy ]

  def index
    @q = model.not_deleted.ransack(params[:q])
    @pagy, @records = pagy(@q.result)
    render "layouts/index"
  end

  def new
    @record = model.new
    render "layouts/form"
  end

  def edit
    render "layouts/form"
  end

  def create
    @record = model.new(record_params)
    if @record.save
      redirect_to edit_record_path(@record), notice: "Record was successfully created."
    else
      render "layouts/form", status: :unprocessable_entity
    end
  end

  def update
    if @record.update(record_params)
      redirect_to edit_record_path(@record), notice: "Record was successfully updated."
    else
      render "layouts/form", status: :unprocessable_entity
    end
  end

  def destroy
    if @record.has_attribute?("status")
      @record.deleted!
    else
      @record.destroy!
    end
    redirect_to records_path, status: :see_other, notice: "Record was successfully deleted."
  end

  protected

  def set_record
    @record = model.find(params.expect(:id))
  end

  def record_params
    raise "record_params not specified"
  end

  def model
    raise "model not specified"
  end
end
