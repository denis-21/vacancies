module PrivatePart
  module CompaniesAdmin
    class ProfileCompaniesController < CompaniesAdmin::BaseController
      def show
      end

      def edit
      end

      def update
        if company.update_attributes company_params
          redirect_to manage_profile_companies_url
        else
          render :edit
        end
      end

      private

      def company_params
        params.require(:company).permit(:name, :link, picture_attributes: [:image, :_destroy])
      end

      helper_method :company
      def company
        @company ||= current_user.company
        @company.build_picture unless @company.picture
        @company
      end
    end
  end
end
