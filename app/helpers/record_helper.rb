module RecordHelper
  def record_title(record)
    record.class.model_name.human
  end

  def records_path(record)
    "/#{record.class.model_name.route_key}"
  end

  def delete_record_path(record)
    "#{records_path(record)}/#{record.id}"
  end
end
