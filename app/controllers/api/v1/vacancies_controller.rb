class Api::V1::VacanciesController < ApplicationController

  def index
    respond_to do |format|
      format.json
    end
  end

  def show
    respond_to do |format|
      format.json
    end
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


