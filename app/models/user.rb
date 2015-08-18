class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :user_projects
  has_many :projects, through: :user_projects
  belongs_to :organization
  belongs_to :role


  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end
end
