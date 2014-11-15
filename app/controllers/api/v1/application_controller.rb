module Api
  module V1
    class ApplicationController < ActionController::Base
      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          device = Device.where(access_token: token).first
          @user = device.user unless device.blank? || device.user_id.blank?
        end
      end

      def get_user
        @user = @user
      end
    end
  end
end

