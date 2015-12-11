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
    buf_vacancies = Vacancy.active.ordered
    buf_vacancies = buf_vacancies.search_by(:company_id, search_params[:company_id]) if search_params[:company_id].present?
    buf_vacancies = buf_vacancies.search_by(:country, search_params[:country]) if search_params[:country].present?
    buf_vacancies = buf_vacancies.search_by(:city, search_params[:city].strip) if search_params[:city].present?
    @vacancies ||=  buf_vacancies.page(params[:page]).per(params[:limit])
  end
end
