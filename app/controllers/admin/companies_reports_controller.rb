module Admin
  class CompaniesReportsController < AdminController
    def show
    end

    private

    helper_method :report
    def report
      @report ||= CompaniesReportBuilder.new(Company.find(params[:id])).by_month_of_year
    end
  end
end
