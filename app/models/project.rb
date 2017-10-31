class Project < ActiveRecord::Base
  #has_many :user_projects
  #has_many :users, through: :user_projects
  validates :title, presence: true
  #Prashanth
  has_many :project_files, :dependent => :delete_all
  has_many :questions, :dependent => :delete_all
  has_many :project_users, :foreign_key => :project_id, :dependent => :delete_all
  has_many :users, through: :project_users, :foreign_key => :project_id
end