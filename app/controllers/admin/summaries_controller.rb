module Admin
  class SummariesController < AdminApplicationController
    def index
    end

    private

    helper_method :summaries
    def summaries
      @summaries ||= Summary.where(vacancy_id: params[:vacancy_id])
    end
  end
end
