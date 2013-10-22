class ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def editor
    role == 'editor'
  end

  def index?
    false
  end

  def show?
    scope.where(:id => post.id).exists?
  end

  def create?
    user.editor? or not post.published?
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end

