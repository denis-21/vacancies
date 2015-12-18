class CompaniesController < ApplicationController
  def index
  end

  def show
  end

  private

  def company_params
    params.require(:company).permit(:name, :link)
  end

  helper_method :companies
  def companies
    @companies ||= Company.ordered
  end

  helper_method :company
  def company
    @company ||= Company.find(params[:id])
  end
end
