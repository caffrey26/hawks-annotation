class ProjectUser < ActiveRecord::Base
    belongs_to :project, class_name: "Project", :foreign_key => :project_id
    belongs_to :user, class_name: "User"
    validates_uniqueness_of :project_id, scope: [:user_id]
end
