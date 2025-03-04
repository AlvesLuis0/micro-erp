module RecordHelper
  def record_title(record = nil)
    if record.nil?
      params[:controller].gsub("_", " ").capitalize
    else
      record.class.model_name.human
    end
  end

  def records_path(record = nil)
    if record.nil?
      "/#{params[:controller]}"
    else
      "/#{record.class.model_name.route_key}"
    end
  end

  def new_record_path(record = nil)
    "#{records_path(record)}/new"
  end

  def delete_record_path(record)
    "#{records_path(record)}/#{record.id}"
  end
end
