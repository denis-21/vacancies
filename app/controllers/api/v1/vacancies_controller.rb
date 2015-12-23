module Api
  module V1
    class VacanciesController < BaseApiController
      def index
      end

      def show
      end

      private

      helper_method :vacancies
      def vacancies
        @vacancies ||= Vacancy.ordered.active
      end

      helper_method :vacancy
      def vacancy
        @vacancy ||= Vacancy.find(params[:id])
      end
    end
  end
end
