module Admin
  class AdminApplicationController < ApplicationController
    layout 'admin_application'

    before_action :authenticate_user!

    private

    helper_method :companies
    def companies
      @companies ||= (current_user.admin ? Company : current_user.companies).all
    end
  end
end
