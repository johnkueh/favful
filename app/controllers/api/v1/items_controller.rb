module Api
  module V1
    class ItemsController < Api::V1::ApplicationController
      before_filter :restrict_access
      before_filter :get_item, only: [:show, :update, :destroy]
      def index
        @items = Item.where(user_id: @user.id) + Like.where(user_id: @user.id).map { |l| l.items }.flatten
      end

      def show
      end

      def create
        @item = Item.new(item_params)
        @item.user = @user

        respond_to do |format|
          if @item.save
            format.json { render action: 'show', status: :created }
          else
            format.json { render json: @item.errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        respond_to do |format|
          if @item.update(item_params)
            format.json { head :no_content }
          else
            format.json { render json: @item.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        @item.destroy
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      def get_item
        @item = Item.find(params[:id])
      end

      private
      def item_params
        params.require(:item).permit(:name, :summary, :is_public, :latitude, :longitude, :fsq_venue_id, :fsq_venue_name)
      end
    end
  end
end

