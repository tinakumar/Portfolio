class Project < ActiveRecord::Base
  attr_accessible :description, :name, :technologies_used
end
