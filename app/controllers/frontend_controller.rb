class FrontendController < ApplicationController
    before_action :authenticate_user!, only: [:add_comment]

    respond_to :html

    def index
        @posts = Post.order('created_at DESC').all
        respond_with(@posts)
    end

    def show_post
        @comment = Comment.new
        respond_with(@post, @comment)
    end

    def add_comment
    end
end
