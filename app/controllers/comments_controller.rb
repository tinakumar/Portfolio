class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = Comment.new(params[:comment])
      if @comment.save
        flash[:notice] = "Comment is awaiting moderation"
        redirect_to post_path(@post)
      else
        redirect_to new_post_comment_path(@post)
      end
   end

end
