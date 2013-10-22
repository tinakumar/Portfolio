class Post < ActiveRecord::Base
  attr_accessible :content, :title, :published

  belongs_to :author, class_name: "User"

  def policy(record)
    "#{record.class}Policy".constantize.new(current_user, record)
  end

  def publish!
  published = true
  save!
  end

end
