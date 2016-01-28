module PublicPart
  class RegisterCompaniesController < BaseController
    STEPS = { first: 'company', second: 'user' }

    before_action :set_start_cookies, only: [:new]

    def new
      render 'company_form'
    end

    def create
      if cookies[:step] == STEPS[:first]
        new_company.assign_attributes(company_params)
        if new_company.valid?
          cookies[:step] = STEPS[:second]
          cookies[:company] = { value: new_company.attributes.to_json }
          render 'user_form'
        else
          render :new
        end
      else
        if new_user.update_attributes(user_params)
          new_user.companies.create(JSON.parse(cookies[:company]))
          clear_cookies
          redirect_to root_url, flash: { success: 'Confirmation expected administrator' }
        else
          render 'user_form'
        end
      end
    end

    private

    def company_params
      params.require(:company).permit(:continent, :country, :city, :name, :link, picture_attributes: [:image, :_destroy])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def set_start_cookies
      cookies[:step] = STEPS[:first] unless cookies[:step].present?
    end

    def clear_cookies
      cookies.delete :step
      cookies.delete :company
    end

    helper_method :new_company
    def new_company
      @company ||= Company.new(picture: Picture.new)
    end

    helper_method :new_user
    def new_user
      @user ||= User.new
    end
  end
end
