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
            @comment = Comment.new(post_params)
            @comment.post = @post
            @comment.user = current_user
            @comment.save

            if request.xhr? or @comment.errors.any?
                return respond_with(@post, @comment)
            end
        end

        @comment = Comment.new
        return respond_with(@post, @comment)
    end

    private
        def post_params
            params.require(:comment).permit(:body, :post_id)
        end
end
