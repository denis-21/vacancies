class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private

  helper_method :countries
  def countries
    @countries ||= ISO3166::Country.all.map{|item| item.name}
  end

  helper_method :companies
  def companies
    @companies ||= Company.all
  end
end
