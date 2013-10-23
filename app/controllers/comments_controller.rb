class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
      respond_to do |format|
      if @comment.save
        format.html { redirect_to [@post, @comment], notice: 'Comment was successfully created.' }
      else
        format.html { render action: "new" }
      end
   end

   def show
    redirect_to posts_path
   end

end
