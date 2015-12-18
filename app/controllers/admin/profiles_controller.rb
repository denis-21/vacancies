module Admin
  class ProfilesController < AdminController
    def edit
    end

    def update
      if profile.update_attributes profile_params
        redirect_to :edit_admin_profiles, flash: { success: 'Your profile updated' }
      else
        render :edit
      end
    end

    private

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :bith_date, picture_attributes: [:image, :_destroy])
    end

    helper_method :profile
    def profile
      @profile ||= current_user.profile || current_user.build_profile
      @profile.build_picture unless @profile.picture
      @profile
    end
  end
end
