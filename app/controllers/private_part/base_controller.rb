module PrivatePart
  class BaseController < ::ApplicationController
    layout 'admin_application'

    before_action :authenticate_user!

    private

    def authenticate_user!
      super
      redirect_to root_url, flash: { error: 'You do not have permission to view' } unless current_user_have_company?
    end

    helper_method :companies
    def companies
      @companies ||= current_user.admin ? Company.all : Company.where(creator_id: current_user)
    end
  end
end
