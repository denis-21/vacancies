module Admin
  class AdminController < AdminApplicationController
    before_action :admin?

    private

    def admin?
      unless current_user.admin
        flash[:error] = 'You do not have permission to view'
        redirect_to admin_root_url
      end
    end
  end
end
