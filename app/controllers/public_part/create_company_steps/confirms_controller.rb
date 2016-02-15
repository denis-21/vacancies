module PublicPart
  module CreateCompanySteps
    class ConfirmsController < StepsController
      before_action :check_data

      def new
      end

      def create
        if user.update_attributes(company: company)
          clear_cookies
          redirect_to root_url, flash: { success: 'Confirmation expected administrator' }
        else
          render :new
        end
      end

      private

      def check_data
        if cookies[:companies].blank?
          rediret_to_step('companies')
        elsif cookies[:users].blank?
          rediret_to_step('users')
        end
      end

      def clear_cookies
        steps.each do |st|
          cookies.delete st.to_sym
        end
        cookies.delete :step
      end

      helper_method :company
      def company
        @company ||= Company.new(JSON.parse(cookies[:companies]))
      end

      helper_method :user
      def user
        @user ||= User.new(JSON.parse(cookies[:users]).merge(locked_at: Time.zone.now))
      end
    end
  end
end
