class Project < ActiveRecord::Base
  belongs_to :organization
  belongs_to :category
  # has_many :categories
  # belongs_to :categorized_project
  belongs_to :image
  mount_uploader :image, ImageUploader
  has_many :user_projects
  has_many :users, through: :user_projects
end
