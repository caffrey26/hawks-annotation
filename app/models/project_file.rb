class ProjectFile < ActiveRecord::Base
    mount_uploader :attachment, AttachmentUploader
    belongs_to :project
    validates :file_name, presence: true,  uniqueness: { scope: :project_id }
    validates_presence_of :attachment

end
