# frozen_string_literal: true

# application controller
class ApplicationController < ActionController::Base
  include Pagy::Backend
  include ErrorHandling
  include Authentication

  before_action :set_locale

  # around_action :switch_locale

  private

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    parsed_locale.to_sym if I18n.available_locales.map(&:to_s).include?(parsed_locale)
  end

  # def switch_locale(&action)                           # &action - действие контроллера которое нужно выполнить
  # 	locale = params[:locale] || I18n.default_locale
  # 	I18n.with_locale locale, &action
  # end

  # def locale_from_url
  # 	locale = params[:locale]

  # 	return locale if I18n.available_locales.map(&:to_s).include?(locale) # сравниваем локаль с теми, что у нас есть
  # end

  # def default_url_options         #переопределение встроенного метода
  # 	{ locale: I18n.locale }
  # end
end
