class Admin::VacanciesController < ApplicationController

  http_basic_authenticate_with :name => "user", :password => "123456"
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
    @vacancies ||= Vacancy.ordered
  end

  helper_method :vacancy
  def vacancy
    @vacancy ||= Vacancy.find(params[:id])
  end

  helper_method :new_vacancy
  def new_vacancy
    @vacancy ||= Vacancy.new
  end
end
