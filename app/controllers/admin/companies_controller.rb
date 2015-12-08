class Admin::CompaniesController < ApplicationController

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
    if new_company.update_attributes company_params
      redirect_to (:admin_companies)
    else
      render :new
    end
  end

  def update
    if company.update_attributes company_params
      redirect_to (:admin_companies)
    else
      render :edit
    end
  end

  def destroy
    company.destroy
    redirect_to (:back)
  end

  private
    def company_params
      params.require(:company).permit(:name, :link)
    end

    helper_method :companies
    def companies
      @companies ||= Company.all.ordered
    end
    helper_method :new_company
    def new_company
      @company ||= Company.new
    end

    helper_method :company
    def company
      @company ||= Company.find(params[:id])
    end

end
