class ProjectFile < ActiveRecord::Base
    belongs_to :project
    mount_uploader :p_file, AvatarUploader
end
