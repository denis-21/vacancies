module PublicPart
  class SummariesController < BaseController
    def new
    end

    def create
      if new_summary.update_attributes summary_params
        redirect_to vacancy_url(params[:vacancy_id]), flash: { success: 'Resume was successfully sent' }
      else
        render :new
      end
    end

    private

    def summary_params
      params.require(:summary).permit(:email, :first_name, :last_name, :file).merge(params.permit(:vacancy_id))
    end

    helper_method :new_summary
    def new_summary
      @summary ||= Summary.new(user_id: current_user.try(:id), email: current_user.try(:email), first_name: current_user.try(:first_name), last_name: current_user.try(:last_name))
    end
  end
end
