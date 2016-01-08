module Admin
  class SummariesController < AdminApplicationController
    def index
    end

    def update
      respond_to do |format|
        format.js
      end if summary.update_status(params[:status])
    end

    private

    helper_method :summaries
    def summaries
      @summaries ||= Summary.where(vacancy_id: params[:vacancy_id])
    end

    helper_method :summary
    def summary
      @summary ||= Summary.find(params[:id])
    end
  end
end
