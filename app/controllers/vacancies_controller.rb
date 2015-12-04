class VacanciesController < ApplicationController

  def index
  end

  def show
  end

  private

  helper_method :vacancies
  def vacancies
    @vacancies ||= Vacancy.all.ordered.active
  end

  helper_method :vacancy
  def vacancy
    @vacancy ||= Vacancy.find(params[:id])
  end

end
