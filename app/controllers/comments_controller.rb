class CommentsController < ApplicationController
  #before_filter :set_post
  #before_filter :find_user, only: [:create]
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :load_commentable

  def index
    @commentable =
    @comments = commentable.comments
  end

  def show
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(params[:comment])
    if @comment.save
      redirect_to @commentable, notice: "Comment is awaiting moderation"
    #params[:comment][:author_email] = current_user.email
    else
      instance_variable_set("@#{resource.singularize}".to_sym, @commentable)
      render template: "#{@resource}/show"
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
    redirect_to @commentable
  end


  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to @commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :author_url, :author_email,
                                    :content, :referrer, :commentable_id)
  end

  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
