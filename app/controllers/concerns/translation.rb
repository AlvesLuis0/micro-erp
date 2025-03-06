module Translation
  extend ActiveSupport::Concern

  included do
    around_action :switch_locale

    def switch_locale(&action)
      logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
      locale = extract_locale_from_accept_language_header
      locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
      logger.debug "* Locale set to '#{locale}'"
      I18n.with_locale(locale, &action)
    end

    private

    def extract_locale_from_accept_language_header
      request.env["HTTP_ACCEPT_LANGUAGE"].scan(/^[a-z]{2}/).first.to_sym
    end
  end
end
