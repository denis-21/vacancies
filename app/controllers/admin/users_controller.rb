class Admin::UsersController <  Admin::AdminController

  before_action :is_admin

  def index
  end

  private

  def is_admin
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
