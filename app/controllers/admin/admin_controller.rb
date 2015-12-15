class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  layout 'admin_application'

  private

  helper_method :companies
  def companies
    if current_user.admin
      @companies ||= Company.all
    else
      @companies ||= current_user.companies.all
    end
  end
end
