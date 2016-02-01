module PublicPart
  module CreateCompanySteps
    class ConfirmsController < StepsController
      before_action :check_data

      def new
      end

      def create
        if User.create(user_data.merge(company: Company.new(company_data)))
          clear_cookies
          redirect_to root_url, flash: { success: 'Confirmation expected administrator' }
        else
          render :new
        end
      end

      private

      def check_data
        if cookies[:companies].blank?
          redirect_to new_create_company_steps_companies_url
        elsif cookies[:users].blank?
          redirect_to new_create_company_steps_users_url
        end
      end

      def clear_cookies
        steps.each do |st|
          cookies.delete st.to_sym
        end
        cookies.delete :step
      end

      helper_method :company_data
      def company_data
        JSON.parse(cookies[:companies])
      end

      helper_method :user_data
      def user_data
        JSON.parse(cookies[:users])
      end
    end
  end
end
