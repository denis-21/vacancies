module PrivatePart
  class BaseController < ::ApplicationController
    layout 'admin_application'

    before_action :authenticate_user!

    private

    helper_method :companies
    def companies
      @companies ||= current_user.admin ? Company.all : Company.where(creator_id: current_user)
    end
  end
end
