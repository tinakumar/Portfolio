class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  attr_accessible :approved, :author, :author_email, :author_url, :content, :referrer, :user_agent, :user_ip

  validates :content, presence: true
  validates :author_email, presence: true

end
