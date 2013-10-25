class ProjectPolicy < ApplicationPolicy

  def initialize(user, project)
    @user = user
    @project = project
  end

  def show?
    scope.where(:id => project.id).exists?
  end

  def create?
    user.editor?
  end

  def update?
    user.editor?
  end

  def destroy?
    user.editor?
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
