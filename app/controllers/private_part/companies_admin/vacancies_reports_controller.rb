module PrivatePart
  module CompaniesAdmin
    class VacanciesReportsController < CompaniesAdmin::BaseController
      def show
        respond_to do |format|
          format.html
          format.js { render layout: false }
        end
      end

      private

      helper_method :report
      def report
        @report = VacanciesReportBuilder.new(current_user.vacancies.find(params[:id])).build(params[:start_day], params[:end_day])
      end
    end
  end
end
