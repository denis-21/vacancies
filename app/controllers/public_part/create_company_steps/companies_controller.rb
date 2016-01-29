module PublicPart
  module CreateCompanySteps
    class CompaniesController < StepsController
      before_action :set_start_cookies, only: [:new]

      def new
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
        params.require(:company).permit(:continent, :country, :city, :name, :link, picture_attributes: [:image, :_destroy])
      end

      helper_method :new_company
      def new_company
        @company ||= Company.new(JSON.parse(cookies[:companies] || '{}').merge(picture: Picture.new))
      end
    end
  end
end
