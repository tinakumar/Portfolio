class CommentsController < ApplicationController
  before_filter :set_post
  before_filter :find_user, only: [:create]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    #@post = Post.find(params[:post_id])
    params[:comment][:author_email] = current_user.email
    @comment = @post.comments.new(params[:comment])
    if @comment.save
      flash[:notice] = "Comment is awaiting moderation"
      redirect_to post_path(@post)
    else
      redirect_to new_post_comment_path(@post)
    end
  end

  def update
    @comment = Comment.find(params[:id])
    authorize @comment
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Comment is approved."
    else
      flash[:notice] = "Sorry, your comment will not be posted."
    end
    redirect_to post_path(@post)
  end


  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def find_user
    @author_email = current_user.email
  end
end
