module Admin
  class UsersController < AdminController
    def index
    end

    private

    helper_method :users
    def users
      @users ||= User.eager_load(:companies, :vacancies).ordered
    end
  end
end
