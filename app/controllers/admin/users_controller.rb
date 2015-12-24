module Admin
  class UsersController < AdminController
    before_action :admin?

    def index
    end

    private

    def admin?
      unless current_user.admin
        flash[:error] = 'You do not have permission to view'
        redirect_to admin_root_url
      end
    end

    helper_method :users
    def users
      @users ||= User.ordered
    end

    helper_method :user
    def user
      @user ||= User.find(params[:id])
    end
  end
end
