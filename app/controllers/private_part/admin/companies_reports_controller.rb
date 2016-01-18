module PrivatePart
  module Admin
    class CompaniesReportsController < Admin::BaseController
      def show
        respond_to do |format|
          format.html
          format.js { render layout: false }
        end
      end

      private

      helper_method :report
      def report
        @report ||= CompaniesReportBuilder.new(Company.find(params[:id])).build(params[:company_report_start_day], params[:company_report_end_day])
      end
    end
  end
end
