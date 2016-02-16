module PrivatePart
  class SummariesHistoryController < BaseController
    def index
    end

    private

    helper_method :summaries
    def summaries
      @summaries ||= current_user.summaries.eager_load(:vacancy, vacancy: :company)
    end
  end
end
