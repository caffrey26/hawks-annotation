class RemoveFileUploadFromProjectFile < ActiveRecord::Migration
  def change
    remove_column :project_files, :string, :string
  end
end
