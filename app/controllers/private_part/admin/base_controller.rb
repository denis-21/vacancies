module PrivatePart
  module Admin
    class BaseController < PrivatePart::BaseController
      layout 'admin_application'
      before_action :admin?

      private

      def admin?
        redirect_to root_url, flash: { error: 'You do not have permission to view' } unless current_user.admin
      end

      helper_method :companies
      def companies
        @comapnies ||= Company.all
      end
    end
  end
end
