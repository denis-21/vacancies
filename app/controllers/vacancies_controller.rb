class VacanciesController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  end

  private

  helper_method :vacancies
  def vacancies
    if params[:limit]
      @vacancies ||= Vacancy.all.ordered.active.page(params[:page]).per(params[:limit])
    else
      @vacancies ||= Vacancy.all.ordered.active.page(params[:page])
    end
  end


  helper_method :vacancy
  def vacancy
    @vacancy ||= Vacancy.find(params[:id])
  end

end
