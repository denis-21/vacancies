module PrivatePart
  module Admin
    class BaseController < PrivatePart::BaseController
      before_action :admin?

      private

      def admin?
        redirect_to manage_root_url, flash: { error: 'You do not have permission to view' } unless current_user.admin
      end

      helper_method :companies
      def companies
        @comapnies ||= Company.all
      end
    end
  end
end
