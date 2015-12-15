class Admin::CompaniesController <  Admin::AdminController

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
      redirect_to (:admin_companies)
    else
      render :new
    end
  end

  def update
    if company.update_attributes company_params
      redirect_to (:admin_companies)
    else
      render :edit
    end
  end

  def destroy
    company.destroy
    redirect_to (:back)
  end

  private

  def company_params
    params.require(:company).permit(:name, :link)
  end

  helper_method :companies
  def companies
    @companies ||= (current_user.admin ? Company : current_user.companies).ordered
  end

  helper_method :new_company
  def new_company
    @company ||= Company.new(creator_id: current_user.id)
  end

  helper_method :company
  def company
    @companies ||= (current_user.admin ? Company : current_user.companies).find(params[:id])
  end
end
