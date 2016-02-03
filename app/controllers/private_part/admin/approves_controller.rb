module PrivatePart
  module Admin
    class ApprovesController < Admin::BaseController
      layout false

      def update
        company.creator.unlock_access! if company.activate!
      end

      def destroy
        company.rejected!
      end

      private

      helper_method :company
      def company
        @comapny ||= Company.find(params[:company_id])
      end
    end
  end
end
