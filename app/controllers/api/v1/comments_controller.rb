module Api
  module V1
    class CommentsController < Api::V1::ApplicationController
      before_filter :restrict_access, :get_item
      before_filter :get_comment, only: [:show, :update, :destroy]
      def index
        @comments = @item.comments
      end

      def show
      end

      def create
        @comment = Comment.new(comment_params)
        @comment.item = @item
        @comment.user = @user

        respond_to do |format|
          if @comment.save
            format.json { render action: 'show', status: :created }
          else
            format.json { render json: @comment.errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        respond_to do |format|
          if @comment.update(comment_params)
            format.json { head :no_content }
          else
            format.json { render json: @comment.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        @comment.destroy
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      def get_item
        @item = Item.find(params[:item_id])
      end

      def get_comment
        @comment = Comment.find(params[:id])
      end

      private
      def comment_params
        params.require(:comment).permit(:content, :user_id)
      end
    end
  end
end

