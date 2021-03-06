module PublicPart
  class CompaniesController < BaseController
    def index
    end

    def show
    end

    private

    helper_method :companies
    def companies
      @companies ||= Company.active.ordered
    end

    helper_method :company
    def company
      @company ||= Company.active.find(params[:id])
    end
  end
end
