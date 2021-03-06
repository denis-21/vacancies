module PrivatePart
  module CompaniesAdmin
    class SummariesController < CompaniesAdmin::BaseController
      def index
      end

      def update
        respond_to do |format|
          if summary.update_status(params[:status])
            format.js { render layout: false }
          else
            format.js { render nothing: true, status: 204 }
          end
        end
      end

      private

      helper_method :summaries
      def summaries
        @summaries ||= current_user.vacancies.find(params[:vacancy_id]).summaries
      end

      helper_method :summary
      def summary
        @summary ||= current_user.vacancies.find(params[:vacancy_id]).summaries.find(params[:id])
      end
    end
  end
end
