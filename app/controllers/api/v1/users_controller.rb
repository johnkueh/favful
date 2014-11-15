module Api
  module V1
    class UsersController < Api::V1::ApplicationController
      def login
        @user = User.where(fb_access_token: user_params[:fb_access_token]).first
        if @user.blank?
          @user = User.new(user_params)
          @user.devices.find_or_initialize_by(
            access_token: SecureRandom.hex,
            vendor_identifier: user_params[:vendor_identifier]
          )
        end
        respond_to do |format|
          if @user.save
            format.json { render action: 'show', status: :created }
          else
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

      private
      def user_params
        params.require(:user).permit(:email, :handle, :fb_access_token, :vendor_identifier)
      end
    end
  end
end

