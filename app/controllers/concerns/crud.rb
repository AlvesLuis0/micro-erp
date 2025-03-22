module Crud
  module Backend
    extend ActiveSupport::Concern

    include Pagy::Backend
    include ResourceHelper

    included do
      before_action :set_resource, only: %i[ edit update destroy ]

      def index
        @q = model.not_status_deleted.ransack(params[:q])
        @pagy, @resources = pagy(@q.result)
        render "layouts/index"
      end

      def new
        @resource = instantiate_resource
        render "layouts/form"
      end

      def edit
        render "layouts/form"
      end

      def create
        @resource = model.new(resource_params)
        if @resource.save
          redirect_to edit_resource_path(@resource), notice: t("flash.saved")
        else
          render "layouts/form", status: :unprocessable_entity
        end
      end

      def update
        if @resource.update(resource_params)
          redirect_to edit_resource_path(@resource), notice: t("flash.saved")
        else
          render "layouts/form", status: :unprocessable_entity
        end
      end

      def destroy
        @resource.status_deleted!
        redirect_to new_resource_path, status: :see_other, notice: t("flash.deleted")
      end

      protected

      def set_resource
        @resource = model.not_status_deleted.find(params.expect(:id))
      end

      def resource_params
        raise "resource_params not specified"
      end

      def model
        raise "model not specified"
      end

      def instantiate_resource
        model.new
      end
    end
  end
end
