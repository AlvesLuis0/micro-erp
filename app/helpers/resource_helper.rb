module ResourceHelper
  def resource_title(resource = nil)
    if resource.nil?
      t("routines.#{params[:controller]}")
    else
      t("routines.#{resource.class.model_name.route_key}")
    end
  end

  def resources_path(resource = nil)
    if resource.nil?
      "/#{params[:controller]}"
    else
      "/#{resource.class.model_name.route_key}"
    end
  end

  def resource_path(resource)
    "#{resources_path}/#{resource.id}"
  end

  def new_resource_path(resource = nil)
    "#{resources_path(resource)}/new"
  end

  def edit_resource_path(resource)
    "#{resource_path(resource)}/edit"
  end
end
