class Admin::VacanciesController < ApplicationController

  before_action :authenticate_user!
  layout 'admin_application'

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
      redirect_to (:admin_vacancies)
    else
      render :new
    end
  end

  def update
    if vacancy.update_attributes vacancy_params
      redirect_to admin_vacancy_url vacancy
    else
      render :edit
    end
  end

  def destroy
    vacancy.destroy
    redirect_to (:back)
  end

  private

  def vacancy_params
    params.require(:vacancy).permit(:title, :description, :country, :city, :company_id,:deadline)
  end

  helper_method :vacancies
  def vacancies
    if current_user.admin
      @vacancies ||= Vacancy.ordered
    else
      @vacancies ||= current_user.vacancies.ordered
    end
  end

  helper_method :vacancy
  def vacancy
    if current_user.admin
      @vacancy ||= current_user.vacancies.find(params[:id])
    else
      @vacancy ||= Vacancy.find(params[:id])
    end
  end

  helper_method :new_vacancy
  def new_vacancy
    @vacancy ||= Vacancy.new
    @vacancy.creator_id = current_user
  end
end
