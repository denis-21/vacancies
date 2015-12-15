class Admin::UserBlocksController <  Admin::UsersController

  layout false

  def create
    user.lock_access!
    respond_to do |format|
      format.js
    end
  end

  def destroy
    user.unlock_access!
    respond_to do |format|
      format.js
    end
  end

  private

  helper_method :user
  def user
    @user ||= User.find(params[:user_id])
  end
end
