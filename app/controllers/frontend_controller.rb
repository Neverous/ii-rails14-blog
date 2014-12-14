class FrontendController < ApplicationController
    before_action :authenticate_user!, only: [:add_comment]

    respond_to :html, :json

    def index
        @posts = Post.order('created_at DESC').all
        respond_with(@posts)
    end

    def show_post
        @post = Post.find(params[:id])
        if request.post?
            @comment = comment_service.call CommentForm.new(post_params)
            if request.xhr? or @comment.errors.any?
                return respond_with(@post, @comment)
            end
        end

        @comment = Comment.new
        return respond_with(@post, @comment)
    end

    private
        def post_params
            params[:comment][:user_id] = current_user.id.to_s
            params[:comment][:post_id] = params[:id]
            params.require(:comment).permit(:body, :post_id, :user_id)
        end

        def comment_service
            @comment_service ||= CommentService.new
        end
end
