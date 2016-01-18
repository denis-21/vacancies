module PrivatePart
  class ReportsController < BaseController
    def index
    end

    private

    helper_method :vacancies
    def vacancies
      @vacancies ||= (current_user.admin ? Vacancy : current_user.vacancies).eager_load(:summaries)
    end
  end
end
