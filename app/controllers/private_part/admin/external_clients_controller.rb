module PrivatePart
  module Admin
    class ExternalClientsController < Admin::BaseController
      def index
      end

      def show
      end

      def new
      end

      def create
        if new_external_client.update_attributes(external_client_params)
          redirect_to admin_external_client_url external_client
        else
          render :new
        end
      end

      def destroy
        external_client.destroy
        redirect_to :admin_external_clients
      end

      private

      def external_client_params
        params.require(:external_client).permit(:name, :description)
      end

      helper_method :new_external_client
      def new_external_client
        @external_client ||= ExternalClient.new
      end

      helper_method :external_client
      def external_client
        @external_client ||= ExternalClient.find(params[:id])
      end

      helper_method :external_clients
      def external_clients
        @external_clients ||= ExternalClient.all
      end
    end
  end
end
