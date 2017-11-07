
class ProjectFile < ActiveRecord::Base
    mount_uploader :attachment, AttachmentUploader
    belongs_to :project
end
