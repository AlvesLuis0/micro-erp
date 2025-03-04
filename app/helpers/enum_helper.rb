module EnumHelper
  def enum_to_select(enum)
    enum.map do |key, value|
      [ t_enum(key), value ]
    end
  end

  def t_enum(enum)
    t("enums.#{enum}")
  end
end
