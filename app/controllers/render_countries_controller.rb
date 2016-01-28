class RenderCountriesController < ApplicationController
  layout false
  def index
  end

  private

  helper_method :continent
  def continent
    @continent =
      if params[:continent].present?
        @continent = params[:continent]
      elsif params.try(:[], :vacancy).try(:[], :continent).present?
        @continent = params[:vacancy][:continent]
      else
        @continent = params.try(:[], :company).try(:[], :continent)
      end
  end
end
