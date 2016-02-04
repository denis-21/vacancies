module PublicPart
  module CreateCompanySteps
    class CompaniesController < StepsController
      def new
        set_start_cookies
      end

      def create
        new_company.assign_attributes(company_params)
        if new_company.valid?
          next_step(company_params)
        else
          render :new
        end
      end

      private

      def company_params
        params.require(:company).permit(:continent, :country, :city, :name, :link)
      end

      helper_method :new_company
      def new_company
        @company ||= Company.new(JSON.parse(cookies[:companies] || '{}'))
      end
    end
  end
end
