class RenderCountriesController < ApplicationController
  layout false
  def index
  end

  private

  helper_method :continent
  def continent
    @continent = params[:continent] || params.try(:[], :vacancy).try(:[], :continent) || params.try(:[], :company).try(:[], :continent)
  end
end
