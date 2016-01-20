class RenderCountriesController < ApplicationController
  layout false
  def index
  end

  private

  helper_method :continent
  def continent
    @continent = params[:continent].present? ? params[:continent] : params[:vacancy][:continent]
  end
end
