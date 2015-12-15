class Admin::UserBlocksController <  Admin::UsersController

  def create
    user.lock_access!
    render partial: 'admin/users/btn_unblock'
  end

  def destroy
    user.unlock_access!
    render partial: 'admin/users/btn_block'
  end

  helper_method :user
  def user
    @user ||= User.find(params[:user_id])
  end
end
