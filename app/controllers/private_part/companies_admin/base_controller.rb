module PrivatePart
  module CompaniesAdmin
    class BaseController < PrivatePart::BaseController
      layout 'admin_application'

      before_action :check_user_company!

      private

      def check_user_company!
        redirect_to root_url, flash: { error: 'You do not have permission to view' } unless current_user_have_company?
      end

      helper_method :companies
      def companies
        @companies ||= current_user.admin ? Company.all : Company.where(creator_id: current_user)
      end
    end
  end
end
