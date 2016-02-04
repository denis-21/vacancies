module PublicPart
  module CreateCompanySteps
    class UsersController < StepsController
      def new
      end

      def create
        new_user.assign_attributes(user_params)
        if new_user.valid?
          next_step(user_params)
        else
          render :new
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end

      helper_method :new_user
      def new_user
        @user ||= User.new(JSON.parse(cookies[:users] || '{}'))
      end
    end
  end
end
