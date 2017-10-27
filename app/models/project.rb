class Project < ActiveRecord::Base
  #has_many :user_projects
  #has_many :users, through: :user_projects
  belongs_to :users
  validates :title, presence: true
  #Prashanth
  has_many :project_files
end
