class CommentPolicy < ApplicationPolicy

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

 def update?
    user.editor? || user.author?
  end

  def destroy?
    user.editor? && (@comment.approved? == false)
  end

end
