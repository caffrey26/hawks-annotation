class AddFileUploadToProjectFile < ActiveRecord::Migration
  def change
    add_column :project_files, :FileUpload, :string
    add_column :project_files, :string, :string
  end
end
