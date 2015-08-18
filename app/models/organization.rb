class Organization < ActiveRecord::Base
  
  has_many :users
  has_many :projects
  has_many :user_projects, through: :projects
end
