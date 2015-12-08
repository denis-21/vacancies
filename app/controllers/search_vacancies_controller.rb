class SearchVacanciesController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def search_params
      params.permit(:company_id, :country, :city)
    end

  helper_method :vacancies
    def vacancies
      buf_vacancies = Vacancy.all.ordered
      buf_vacancies = buf_vacancies.search_company(search_params[:company_id]) if search_params[:company_id].present?
      buf_vacancies = buf_vacancies.search_country(search_params[:country]) if search_params[:country].present?
      buf_vacancies = buf_vacancies.search_city(search_params[:city]) if search_params[:city].present?

      if params[:limit]
        @vacancies ||=  buf_vacancies.active.page(params[:page]).per(params[:limit])
      else
        @vacancies ||=  buf_vacancies.active.page(params[:page])
      end


    end

end
