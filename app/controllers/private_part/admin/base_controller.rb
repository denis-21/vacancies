module PrivatePart
  module Admin
    class BaseController < PrivatePart::BaseController
      before_action :admin?

      private

      def admin?
        unless current_user.admin
          flash[:error] = 'You do not have permission to view'
          redirect_to manage_root_url
        end
      end
    end
  end
end
