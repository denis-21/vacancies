module PublicPart
  module CreateCompanySteps
    class StepsController < BaseController
      STEPS = %w(companies users confirms)

      private

      def next_step(step_params)
        cookies[controller_name.to_sym] = { value: step_params.to_json }
        step_next = STEPS[STEPS.index(controller_name) + 1]
        cookies[:step] = step_next
        redirect_to setup_step_path(step_next)
      end

      def set_start_cookies
        cookies[:step] ||= STEPS.first
      end

      helper_method :steps
      def steps
        STEPS
      end

      helper_method :current_step
      def current_step
        cookies[:step].present? ? cookies[:step] : nil
      end

      helper_method :setup_step_path
      def setup_step_path(step_path)
        send('new_create_company_steps_'.concat(step_path).concat('_path'))
      end
    end
  end
end
