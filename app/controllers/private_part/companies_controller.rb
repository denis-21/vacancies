module PrivatePart
  class CompaniesController < BaseController
    def index
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
      if new_company.update_attributes company_params
        redirect_to manage_company_url company
      else
        render :new
      end
    end

    def update
      if company.update_attributes company_params
        redirect_to manage_company_url company
      else
        render :edit
      end
    end

    def destroy
      company.destroy
      redirect_to :manage_companies
    end

    private

    def company_params
      params.require(:company).permit(:name, :link, picture_attributes: [:image, :_destroy])
    end

    helper_method :companies
    def companies
      @companies ||= (current_user.admin ? Company : current_user.companies).eager_load(:vacancies).ordered
    end

    helper_method :new_company
    def new_company
      @company ||= Company.new(creator_id: current_user.id, picture: Picture.new)
    end

    helper_method :company
    def company
      @company ||= (current_user.admin ? Company : current_user.companies).find(params[:id])
      @company.build_picture unless @company.picture
      @company
    end
  end
end
