class RemoveUploadedfileFromProjectFiles < ActiveRecord::Migration
  def change
    remove_column :project_files, :uploadedfile, :string
  end
end
