module Api
  module V1
    class CompaniesController < BaseApiController
      def index
      end

      def show
      end

      private

      helper_method :companies
      def companies
        @companies ||= Company.ordered
      end

      helper_method :company
      def company
        @company ||= Company.find(params[:id])
      end
    end
  end
end
