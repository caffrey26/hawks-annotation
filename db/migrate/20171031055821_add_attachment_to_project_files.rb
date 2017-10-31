class AddAttachmentToProjectFiles < ActiveRecord::Migration
  def change
    add_column :project_files, :attachment, :string
  end
end
