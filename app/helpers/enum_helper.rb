module EnumHelper
  def enum_to_select(enum)
    enum.map do |key, value|
      [ t_enum(key), value ]
    end
  end
end
