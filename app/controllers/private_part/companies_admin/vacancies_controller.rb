module PrivatePart
  module CompaniesAdmin
    class VacanciesController < CompaniesAdmin::BaseController
      def index
      end

      def show
      end

      def new
      end

      def edit
      end

      def create
        if new_vacancy.update_attributes vacancy_params
          redirect_to manage_vacancy_url new_vacancy
        else
          render :new
        end
      end

      def update
        if vacancy.update_attributes vacancy_params
          redirect_to manage_vacancy_url vacancy
        else
          render :edit
        end
      end

      def destroy
        vacancy.destroy
        redirect_to :manage_vacancies
      end

      private

      def vacancy_params
        params.require(:vacancy).permit(:title, :description, :continent, :country, :city, :company_id, :deadline)
      end

      helper_method :vacancies
      def vacancies
        @vacancies ||= (current_user.admin ? Vacancy : current_user.vacancies).company_name.summaries_received_states
      end

      helper_method :vacancy
      def vacancy
        @vacancy ||= (current_user.admin ? Vacancy : current_user.vacancies).find(params[:id])
      end

      helper_method :new_vacancy
      def new_vacancy
        @vacancy ||= Vacancy.new(creator_id: current_user.id)
      end
    end
  end
end
