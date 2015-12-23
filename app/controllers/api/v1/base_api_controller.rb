module Api
  module V1
    class BaseApiController < ApplicationController
      before_action :restrict_access

      private

      def restrict_access
        if params[:access_token].blank?
          render json: { errors: 'No token authorization' }, status: 401
        else
          render json: { errors: 'Invalid token authorization' }, status: 401 unless ExternalClient.exists?(secret_key: params[:access_token])
        end
      end
    end
  end
end
