class Post < ActiveRecord::Base
  attr_accessible :content, :title, :published

  belongs_to :author, class_name: "User"

  scope :published, where(published: true)

  def publish!
    published = true
    save!
  end

  def policy(record)
    "#{record.class}Policy".constantize.new(current_user, record)
  end

    def author?
    role == 'author'
  end

  def editor?
    role == 'editor'
  end
end
