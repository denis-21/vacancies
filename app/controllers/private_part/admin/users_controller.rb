module PrivatePart
  module Admin
    class UsersController < Admin::BaseController
      def index
      end

      private

      helper_method :users
      def users
        @users ||= User.eager_load(:company, :vacancies).ordered
      end
    end
  end
end
