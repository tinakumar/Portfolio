class Project < ActiveRecord::Base
  attr_accessible :description, :name, :technologies_used
  has_many :comments, as: :commentable, dependent: :destroy
end
