class PostPolicy < ApplicationPolicy

  def initialize(user, post)
    @user = user
    @post = post
  end

  def show?
    scope.where(:id => post.id).exists?
  end

  def create?
    user.editor? or not post.published?
  end

  def update?
    user.editor? || user.author?
  end

  def destroy?
    user.editor? && !post.published?
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
     if user.present? && user.editor?
       scope.all
     elsif user.present? && user.author?
       scope.where(author_id: user.id) | scope.published
     else
       scope.where(published: true)
    end
  end
 end
end



