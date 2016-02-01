class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  helper_method :countries
  def countries(continent = nil)
    @countries ||= continent.present? ? ISO3166::Country.find_all_countries_by_continent(continent) : ISO3166::Country.all.map(&:name)
  end

  helper_method :continents
  def continents
    @continents ||= ISO3166::Country.all.map(&:continent).uniq.sort!
  end
end
