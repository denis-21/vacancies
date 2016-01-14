module PublicPart
  class BaseController < ::ApplicationController
    private

    helper_method :companies
    def companies
      @companies ||= Company.all
    end
  end
end
