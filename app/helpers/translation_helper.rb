module TranslationHelper
  def t_enum(enum)
    t("enums.#{enum}")
  end

  def t_link_to(name = nil, options = nil, html_options = nil, &block)
    if name.present?
      name = t(name)
    end
    link_to(name, options, html_options, &block)
  end
end
