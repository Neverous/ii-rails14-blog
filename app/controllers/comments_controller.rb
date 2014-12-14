class CommentsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_comment, only: [:show, :edit, :update, :destroy]

    respond_to :html

    def index
        @comments = Comment.all
        respond_with(@comments)
    end

    def show
        respond_with(@comment)
    end

    def new
        @comment = Comment.new
        respond_with(@comment)
    end

    def edit
    end

    def create
        @comment = comment_service.call CommentForm.new(comment_params)
        if @comment
            flash[:notice] = "Comment created"
            respond_with(@comment)

        else
            flash[:error] = "Comment creation failed"
            redirect_to new_comment_path
        end
    end

    def update
        @comment.update(comment_params)
        respond_with(@comment)
    end

    def destroy
        @comment.destroy
        respond_with(@comment)
    end

    private
        def set_comment
            @comment = Comment.find(params[:id])
        end

        def comment_params
            params.require(:comment).permit(:body, :user_id, :post_id)
        end

        def comment_service
            @comment_service ||= CommentService.new
        end
end
