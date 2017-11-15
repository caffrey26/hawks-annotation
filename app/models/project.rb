class Project < ActiveRecord::Base
  #has_many :user_projects
  #has_many :users, through: :user_projects
  validates :title, presence: true,  uniqueness: { scope: :admin_id }
  #Prashanth
  has_many :project_files
  has_many :questions
  has_many :project_users, :foreign_key => :project_id
  has_many :users, through: :project_users, :foreign_key => :project_id
end
