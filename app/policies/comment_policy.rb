class CommentPolicy < ApplicationPolicy

 def update?
    user.editor? || user.author?
  end

  def destroy?
    user.editor? && !comment.approved?
  end

end
